//
//  ContentView.swift
//  Recipe Finder
//
//  Created by Nathan Geronimo on 7/15/24.
//

import SwiftUI

struct HomeScreen: View {
    
    @State private var viewModel = ViewModel()
    
    // MARK: - Body
    
    var body: some View {
        VStack(spacing: 10) {
            Button(action: { Task {
                try await viewModel.fetchDesserts()
            }}) {
                Text("Show Desserts")
                    .font(.title)
            }
            .padding()
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.blue, lineWidth: 1.0)
            )
            
            if let desserts = viewModel.desserts {
                List(desserts.meals) { dessert in
                    Card(item: dessert)
                        .listRowSeparator(.hidden)
                }
                .listStyle(.plain)
            }
            
            Spacer()
        }
    }
    
    
    // MARK: - Views
    
    
    // MARK: - Functions
}


#Preview {
    HomeScreen()
}
