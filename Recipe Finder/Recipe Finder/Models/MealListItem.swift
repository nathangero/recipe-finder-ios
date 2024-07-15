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
    
    init(_ meal: String, _ thumbnail: String, _ mealId: String) {
        id = UUID()
        strMeal = meal
        strMealThumb = thumbnail
        idMeal = mealId
    }
    
    
    func getMock() -> MealListItem {
        return MealListItem("Apple Frangipan Tart", "https://www.themealdb.com/images/media/meals/wxywrq1468235067.jpg", "52768")
    }
}
