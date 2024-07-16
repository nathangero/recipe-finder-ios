//
//  Meal.swift
//  Recipe Finder
//
//  Created by Nathan Geronimo on 7/15/24.
//

import Foundation

struct Recipe: Identifiable, Codable, DictionaryConvertible {    
    
    enum CodingKeys: String, CodingKey {
        case strMeal
        case strInstructions
        case strMealThumb
        case strIngredient1
        case strIngredient2
        case strIngredient3
        case strIngredient4
        case strIngredient5
        case strIngredient6
        case strIngredient7
        case strIngredient8
        case strIngredient9
        case strIngredient10
        case strIngredient11
        case strIngredient12
        case strIngredient13
        case strIngredient14
        case strIngredient15
        case strIngredient16
        case strIngredient17
        case strIngredient18
        case strIngredient19
        case strIngredient20
        case strMeasure1
        case strMeasure2
        case strMeasure3
        case strMeasure4
        case strMeasure5
        case strMeasure6
        case strMeasure7
        case strMeasure8
        case strMeasure9
        case strMeasure10
        case strMeasure11
        case strMeasure12
        case strMeasure13
        case strMeasure14
        case strMeasure15
        case strMeasure16
        case strMeasure17
        case strMeasure18
        case strMeasure19
        case strMeasure20
    }
    
    var id: UUID
    
    let strMeal: String
    let ingredientsAndMeasurements: [IngredientMeasurement]
    
    let strInstructions: String
    let strMealThumb: String
    let strIngredient1: String
    let strIngredient2: String
    let strIngredient3: String
    let strIngredient4: String
    let strIngredient5: String
    let strIngredient6: String
    let strIngredient7: String
    let strIngredient8: String
    let strIngredient9: String
    let strIngredient10: String
    let strIngredient11: String
    let strIngredient12: String
    let strIngredient13: String
    let strIngredient14: String
    let strIngredient15: String
    let strIngredient16: String
    let strIngredient17: String
    let strIngredient18: String
    let strIngredient19: String
    let strIngredient20: String
    let strMeasure1: String
    let strMeasure2: String
    let strMeasure3: String
    let strMeasure4: String
    let strMeasure5: String
    let strMeasure6: String
    let strMeasure7: String
    let strMeasure8: String
    let strMeasure9: String
    let strMeasure10: String
    let strMeasure11: String
    let strMeasure12: String
    let strMeasure13: String
    let strMeasure14: String
    let strMeasure15: String
    let strMeasure16: String
    let strMeasure17: String
    let strMeasure18: String
    let strMeasure19: String
    let strMeasure20: String
    
    init() {
        id = UUID()
        strMeal = ""
        ingredientsAndMeasurements = []
        
        strInstructions = ""
        strMealThumb = ""
        strIngredient1 = ""
        strIngredient2 = ""
        strIngredient3 = ""
        strIngredient4 = ""
        strIngredient5 = ""
        strIngredient6 = ""
        strIngredient7 = ""
        strIngredient8 = ""
        strIngredient9 = ""
        strIngredient10 = ""
        strIngredient11 = ""
        strIngredient12 = ""
        strIngredient13 = ""
        strIngredient14 = ""
        strIngredient15 = ""
        strIngredient16 = ""
        strIngredient17 = ""
        strIngredient18 = ""
        strIngredient19 = ""
        strIngredient20 = ""
        strMeasure1 = ""
        strMeasure2 = ""
        strMeasure3 = ""
        strMeasure4 = ""
        strMeasure5 = ""
        strMeasure6 = ""
        strMeasure7 = ""
        strMeasure8 = ""
        strMeasure9 = ""
        strMeasure10 = ""
        strMeasure11 = ""
        strMeasure12 = ""
        strMeasure13 = ""
        strMeasure14 = ""
        strMeasure15 = ""
        strMeasure16 = ""
        strMeasure17 = ""
        strMeasure18 = ""
        strMeasure19 = ""
        strMeasure20 = ""
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        id = UUID()
        strMeal = try container.decode(String.self, forKey: .strMeal)
        strInstructions = try container.decode(String.self, forKey: .strInstructions)
        strMealThumb = try container.decode(String.self, forKey: .strMealThumb)
        
        strIngredient1 = try container.decode(String.self, forKey: .strIngredient1)
        strIngredient2 = try container.decode(String.self, forKey: .strIngredient2)
        strIngredient3 = try container.decode(String.self, forKey: .strIngredient3)
        strIngredient4 = try container.decode(String.self, forKey: .strIngredient4)
        strIngredient5 = try container.decode(String.self, forKey: .strIngredient5)
        strIngredient6 = try container.decode(String.self, forKey: .strIngredient6)
        strIngredient7 = try container.decode(String.self, forKey: .strIngredient7)
        strIngredient8 = try container.decode(String.self, forKey: .strIngredient8)
        strIngredient9 = try container.decode(String.self, forKey: .strIngredient9)
        strIngredient10 = try container.decode(String.self, forKey: .strIngredient10)
        strIngredient11 = try container.decode(String.self, forKey: .strIngredient11)
        strIngredient12 = try container.decode(String.self, forKey: .strIngredient12)
        strIngredient13 = try container.decode(String.self, forKey: .strIngredient13)
        strIngredient14 = try container.decode(String.self, forKey: .strIngredient14)
        strIngredient15 = try container.decode(String.self, forKey: .strIngredient15)
        strIngredient16 = try container.decode(String.self, forKey: .strIngredient16)
        strIngredient17 = try container.decode(String.self, forKey: .strIngredient17)
        strIngredient18 = try container.decode(String.self, forKey: .strIngredient18)
        strIngredient19 = try container.decode(String.self, forKey: .strIngredient19)
        strIngredient20 = try container.decode(String.self, forKey: .strIngredient20)
        
        strMeasure1 = try container.decode(String.self, forKey: .strMeasure1)
        strMeasure2 = try container.decode(String.self, forKey: .strMeasure2)
        strMeasure3 = try container.decode(String.self, forKey: .strMeasure3)
        strMeasure4 = try container.decode(String.self, forKey: .strMeasure4)
        strMeasure5 = try container.decode(String.self, forKey: .strMeasure5)
        strMeasure6 = try container.decode(String.self, forKey: .strMeasure6)
        strMeasure7 = try container.decode(String.self, forKey: .strMeasure7)
        strMeasure8 = try container.decode(String.self, forKey: .strMeasure8)
        strMeasure9 = try container.decode(String.self, forKey: .strMeasure9)
        strMeasure10 = try container.decode(String.self, forKey: .strMeasure10)
        strMeasure11 = try container.decode(String.self, forKey: .strMeasure11)
        strMeasure12 = try container.decode(String.self, forKey: .strMeasure12)
        strMeasure13 = try container.decode(String.self, forKey: .strMeasure13)
        strMeasure14 = try container.decode(String.self, forKey: .strMeasure14)
        strMeasure15 = try container.decode(String.self, forKey: .strMeasure15)
        strMeasure16 = try container.decode(String.self, forKey: .strMeasure16)
        strMeasure17 = try container.decode(String.self, forKey: .strMeasure17)
        strMeasure18 = try container.decode(String.self, forKey: .strMeasure18)
        strMeasure19 = try container.decode(String.self, forKey: .strMeasure19)
        strMeasure20 = try container.decode(String.self, forKey: .strMeasure20)
        
        // Compact the array to eliminate all nil values
        ingredientsAndMeasurements = [
            IngredientMeasurement(strIngredient1, strMeasure1),
            IngredientMeasurement(strIngredient2, strMeasure2),
            IngredientMeasurement(strIngredient3, strMeasure3),
            IngredientMeasurement(strIngredient4, strMeasure4),
            IngredientMeasurement(strIngredient5, strMeasure5),
            IngredientMeasurement(strIngredient6, strMeasure6),
            IngredientMeasurement(strIngredient7, strMeasure7),
            IngredientMeasurement(strIngredient8, strMeasure8),
            IngredientMeasurement(strIngredient9, strMeasure9),
            IngredientMeasurement(strIngredient10, strMeasure10),
            IngredientMeasurement(strIngredient11, strMeasure11),
            IngredientMeasurement(strIngredient12, strMeasure12),
            IngredientMeasurement(strIngredient13, strMeasure13),
            IngredientMeasurement(strIngredient14, strMeasure14),
            IngredientMeasurement(strIngredient15, strMeasure15),
            IngredientMeasurement(strIngredient16, strMeasure16),
            IngredientMeasurement(strIngredient17, strMeasure17),
            IngredientMeasurement(strIngredient18, strMeasure18),
            IngredientMeasurement(strIngredient19, strMeasure19),
            IngredientMeasurement(strIngredient20, strMeasure20),
        ].compactMap { value in
            if !value.ingredient.isEmpty && !value.measurement.isEmpty {
                return value
            }
            return nil
        }
        
    }
    
}


struct IngredientMeasurement: Hashable {
    let id: UUID
    let ingredient: String
    let measurement: String
    
    init(_ ingredient: String, _ measurement: String) {
        id = UUID()
        self.ingredient = ingredient
        self.measurement = measurement
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
        hasher.combine(ingredient)
        hasher.combine(measurement)
    }

    static func == (lhs: IngredientMeasurement, rhs: IngredientMeasurement) -> Bool {
        return lhs.id == rhs.id &&
               lhs.ingredient == rhs.ingredient &&
               lhs.measurement == rhs.measurement
    }
}
