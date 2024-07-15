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
        
        var desserts: MealList?
        
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
        
        
        func fetchRecipe(with mealId: String) async throws {
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
            
            let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
            
            guard let dict = json as? [String: Any] else {
                print("couldn't serialize", json)
                throw NSError(domain: "Serialization", code: -1, userInfo: [NSLocalizedDescriptionKey: "Failed to serialize object to dictionary"])
            }
            
            let meals = dict["meals"] as? Array<Any>
            let meal = meals?.first as? [String: Any]
            
            let filteredDict = meal?.sorted(by: { $0.key < $1.key }).compactMap { element in
//                print("element:", element)
                if let strValue = element.value as? String, !strValue.isEmpty {
                    return [element.key: strValue]
                }
                
                return nil
            }
            
//            print(filteredDict)
//            for (key, value) in filteredDict!.enumerated() {
//                print("\(key): \(value)")
//            }
        }
    }
}
