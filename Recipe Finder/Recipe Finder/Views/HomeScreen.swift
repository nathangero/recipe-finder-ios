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
                
                recipeList
            }
            .navigationDestination(isPresented: $viewModel.isShowingRecipe) {
                RecipeView(
                    isPresented: $viewModel.isShowingRecipe,
                    recipe: viewModel.fullRecipe
                )
            }
        }
        .navigationTitle("home")
    }
    
    
    // MARK: - Views
    private var recipeList: some View {
        VStack {
            if let desserts = viewModel.desserts {
                List(desserts.meals) { dessert in
                    VStack {
                        Card(
                            item: dessert
                        )
                        .listRowSeparator(.hidden)
                        
                        // Fetches the full recipe then changes screens
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
    
}


#Preview {
    HomeScreen()
}
