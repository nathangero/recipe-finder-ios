//
//  HomeScreen_ViewModel.swift
//  Recipe Finder
//
//  Created by Nathan Geronimo on 7/15/24.
//

import Foundation

extension HomeScreen {
    @Observable
    final class ViewModel {
        
        var fullRecipe = RecipeList()
        var desserts: MealList?
        var isShowingRecipe = false
        
        func fetchDesserts() async throws {
            let urlString = API_DESSERTS
            
            guard let url = URL(string: urlString) else {
                print("couldn't make into url")
                throw NSError(domain: "Couldn't make into url", code: 1)
            }
            
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            request.cachePolicy = .reloadIgnoringLocalCacheData
            
            let (data, response) = try await URLSession.shared.data(for: request)
            
            // Check if request was successful
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                print("response NOT 200")
                throw URLError(.badServerResponse)
            }
            
            let meals = try JSONDecoder().decode(MealList.self, from: data)
            desserts = meals
        }
        
        
        func fetchRecipe(with mealId: String) async throws -> RecipeList {
            let urlString = "\(API_LOOKUP_MEAL_ID)\(mealId)"
            
            guard let url = URL(string: urlString) else {
                print("couldn't make into url")
                throw NSError(domain: "Couldn't make into url", code: 1)
            }
            
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            request.cachePolicy = .reloadIgnoringLocalCacheData
            
            let (data, response) = try await URLSession.shared.data(for: request)
            
            // Check if request was successful
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                print("response NOT 200")
                throw URLError(.badServerResponse)
            }
            
            let recipe = try JSONDecoder().decode(RecipeList.self, from: data)
//            print("recipe:", recipe)
            
            return recipe
        }
    }
}
