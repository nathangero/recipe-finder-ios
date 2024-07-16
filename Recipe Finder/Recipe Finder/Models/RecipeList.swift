//
//  RecipeList.swift
//  Recipe Finder
//
//  Created by Nathan Geronimo on 7/15/24.
//

import Foundation

struct RecipeList: Codable, DictionaryConvertible {
    let meals: [Recipe]
    
    init() {
        meals = [Recipe]()
    }
}
