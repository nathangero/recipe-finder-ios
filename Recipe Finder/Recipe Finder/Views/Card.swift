//
//  Card.swift
//  Recipe Finder
//
//  Created by Nathan Geronimo on 7/15/24.
//

import SwiftUI

struct Card: View {
    
    // MARK: - Variables
    @Environment(\.colorScheme) var colorScheme
    @State var thumbnail: Image?
    let item: MealListItem
    
    // MARK: - Body
    
    var body: some View {
        VStack(alignment: .center, spacing: 10) {
            Text(item.strMeal)
                .font(.largeTitle)
                .multilineTextAlignment(.center)
                .padding(.top)
              
            thumbnail?
                .resizable()
                .padding()
                .scaledToFit()
                .frame(maxWidth: .infinity, alignment: .center)
        }
        .onAppear(perform: {
            Task {
                try await fetchThumbnail(with: item.strMealThumb)
            }
        })
    }
    
    // MARK: - Functions
    
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
    return Card(item: MealListItem().getMock())
}
