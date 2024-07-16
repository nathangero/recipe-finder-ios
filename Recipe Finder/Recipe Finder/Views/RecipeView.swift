//
//  RecipeView.swift
//  Recipe Finder
//
//  Created by Nathan Geronimo on 7/15/24.
//

import SwiftUI

struct RecipeView: View {
    
    @State var title: String = "Full recipe"
    @State var thumbnail: Image?
    var recipe: RecipeList
    
    // MARK: - Body
    var body: some View {
        VStack {
            List(recipe.meals) { info in
                
                thumbnail?
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: .infinity, alignment: .center)
                    .listRowSeparator(.hidden)
                
                Text("Ingredients & Measurements")
                    .font(.title2)
                    .underline()
                    .frame(maxWidth: .infinity, alignment: .center)
                    .onAppear {
                        title = info.strMeal
                        Task { try await fetchThumbnail(with: info.strMealThumb) }
                    }
                
                ForEach(info.ingredientsAndMeasurements, id: \.self) { element in
                    Text("\(element.ingredient): \(element.measurement)")
                }
                .listRowSeparator(.hidden)
                .listStyle(.grouped)
                
                
                Text("Instructions")
                    .font(.title2)
                    .underline()
                    .frame(maxWidth: .infinity, alignment: .center)
                
                ForEach(Array(getInstructions(with: info.strInstructions).enumerated()), id: \.offset) { index, str in
                    Text("\(index + 1)) \(str)")
                }
                .listRowSeparator(.hidden)
                .listStyle(.grouped)
            }
            .listStyle(.plain)
        }
        .navigationTitle(title)
        .navigationBarTitleDisplayMode(.automatic)
    }
    
    // MARK: - Functions
    
    
    /// Creates an array of strings to iterate over to list step-by-step instructions
    /// - Parameter str: String. The instructions
    /// - Returns: An array of strings
    private func getInstructions(with str: String) -> [String] {
        let separators = CharacterSet(charactersIn: ".\n")

        // Split the string by the CharacterSet
        let components = str.components(separatedBy: separators)

        // Remove any empty components (if there are multiple separators in a row)
        let filteredComponents = components.map { $0.trimmingCharacters(in: .whitespacesAndNewlines) }.filter { !$0.isEmpty }
        
        return filteredComponents
    }
    
    
    /// Fetches the thumbnail of the meal from the api, and saves it to a state variable
    /// - Parameter photoUrl: String. The thumnail url from the api
    private func fetchThumbnail(with photoUrl: String) async throws {
        guard let url = URL(string: photoUrl) else {
            print("couldn't get icon")
            throw NSError(domain: "Couldn't get weather icon", code: 0)
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.cachePolicy = .reloadIgnoringLocalCacheData
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        // Check if request was successful
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }
        
        guard let icon = UIImage(data: data) else {
            print("couldn't download weather icon")
            throw NSError(domain: "Couldn't read the icon", code: 1)
        }
        
        thumbnail = Image(uiImage: icon)
    }
}

#Preview {
    @State var stubBool = false
    return RecipeView(recipe: RecipeList())
}
