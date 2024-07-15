//
//  MealList.swift
//  Recipe Finder
//
//  Created by Nathan Geronimo on 7/15/24.
//

import Foundation

struct MealList: Codable, DictionaryConvertible {
    let meals: [MealListItem]
    
    init() {
        meals = [MealListItem]()
    }
}
