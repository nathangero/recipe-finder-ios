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
        
        var alertTitle = "Couldn't get data"
        var alertBody = "Couldn't connect to server to fetch data. Please try again"
        
        var fullRecipe = RecipeList()
        var desserts: MealList?
        
        var isShowingRecipe = false
        var isShowingAlert = false
        
        
        /// Fetches a list of desserts from the api, then saves it in the `desserts` variable
        func fetchDesserts() async throws {
            let urlString = API_DESSERTS
            
            guard let url = URL(string: urlString) else {
//                print("couldn't make into url")
                isShowingAlert = true
                throw NSError(domain: "Couldn't make into url", code: 1)
            }
            
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            request.cachePolicy = .reloadIgnoringLocalCacheData
            
            let (data, response) = try await URLSession.shared.data(for: request)
            
            // Check if request was successful
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
//                print("response NOT 200")
                isShowingAlert = true
                throw URLError(.badServerResponse)
            }
            
            let meals = try JSONDecoder().decode(MealList.self, from: data)
            desserts = meals
        }
        
        
        /// Uses the `mealId` to get the full recipe of the meal
        /// - Parameter mealId: String
        /// - Returns: RecipeList object
        func fetchRecipe(with mealId: String) async throws -> RecipeList {
            let urlString = "\(API_LOOKUP_MEAL_ID)\(mealId)"
            
            guard let url = URL(string: urlString) else {
                print("couldn't make into url")
                isShowingAlert = true
                throw NSError(domain: "Couldn't make into url", code: 1)
            }
            
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            request.cachePolicy = .reloadIgnoringLocalCacheData
            
            let (data, response) = try await URLSession.shared.data(for: request)
            
            // Check if request was successful
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                print("response NOT 200")
                isShowingAlert = true
                throw URLError(.badServerResponse)
            }
            
            let recipe = try JSONDecoder().decode(RecipeList.self, from: data)
//            print("recipe:", recipe)
            
            return recipe
        }
    }
}
