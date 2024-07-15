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
        VStack {
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
            
            Spacer()
        }
    }
    
    
    // MARK: - Views
    
    
    // MARK: - Functions
}


#Preview {
    HomeScreen()
}
