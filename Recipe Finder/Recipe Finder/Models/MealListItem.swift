//
//  MealListItem.swift
//  Recipe Finder
//
//  Created by Nathan Geronimo on 7/15/24.
//

import Foundation

struct MealListItem: Identifiable, Codable, DictionaryConvertible {
    enum CodingKeys: String, CodingKey {
        case strMeal, strMealThumb, idMeal
    }
    
    var id: UUID
    
    let strMeal: String
    let strMealThumb: String
    let idMeal: String
    
    init() {
        id = UUID()
        strMeal = ""
        strMealThumb = ""
        idMeal = ""
    }
    
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = UUID()
        strMeal = try container.decode(String.self, forKey: .strMeal)
        strMealThumb = try container.decode(String.self, forKey: .strMealThumb)
        idMeal = try container.decode(String.self, forKey: .idMeal)
    }
}
