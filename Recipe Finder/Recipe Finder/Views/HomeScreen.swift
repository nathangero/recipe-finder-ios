//
//  ContentView.swift
//  Recipe Finder
//
//  Created by Nathan Geronimo on 7/15/24.
//

import SwiftUI

struct HomeScreen: View {    
    @Environment(\.colorScheme) var colorScheme
    @State private var viewModel = ViewModel()

    
    // MARK: - Body
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 10) {
                if viewModel.desserts?.meals == nil {
                    Button(action: { Task {
                        try await viewModel.fetchDesserts()
                    }}) {
                        Text("Show Desserts")
                            .font(.title)
                            .padding()
                    }
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.blue, lineWidth: 1.0)
                    )
                }
                listRecipe
            }
            .navigationDestination(isPresented: $viewModel.isShowingRecipe) {
                RecipeView(
                    recipe: viewModel.fullRecipe
                )
            }
            .alert(
                viewModel.alertTitle,
                isPresented: $viewModel.isShowingAlert,
                actions: {
                    Button(action: {}) { Text("Got it") }
                },
                message: { Text(viewModel.alertBody) })
        }
        .navigationTitle("home")
    }
    
    
    // MARK: - Views
    
    
    /// Shows the list of desserts
    private var listRecipe: some View {
        VStack {
            if let desserts = viewModel.desserts {
                List(desserts.meals) { dessert in
                    VStack {
                        Card(
                            item: dessert
                        )
                        .listRowSeparator(.hidden)
                        
                        // Fetches the full recipe then changes screens
                        btnViewRecipe(dessert)
                    }
                    .listRowSeparator(.hidden)
                    .frame(width: UIScreen.main.bounds.width - 30)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(colorScheme == .dark ? .white : .black, lineWidth: 2)
                    )
                    
                }
                .listStyle(.plain)
            }
        }
    }
    
    
    /// Creates a button that when tapped, will fetch the full recipe and transition the screen to RecipeView
    /// - Parameter dessert: MealListItem object
    /// - Returns: A View Button
    private func btnViewRecipe(_ dessert: MealListItem) -> some View {
        Button(action: {
            Task {
                viewModel.fullRecipe = try await viewModel.fetchRecipe(with: dessert.idMeal)
                viewModel.isShowingRecipe = true
            }
        }) {
            HStack {
                Spacer()
                
                Text("Tap to see recipe")
                    .font(.title)
                    .foregroundStyle(colorScheme == .dark ? .white : .black)
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.blue, lineWidth: 1.0)
                    )
                    .padding(.bottom)
                
                Spacer()
            }
        }
        .buttonStyle(PlainButtonStyle()) // Prevents whole item being a button
    }
}


#Preview {
    HomeScreen()
}
