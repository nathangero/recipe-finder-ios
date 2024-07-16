//
//  Api.swift
//  Recipe Finder
//
//  Created by Nathan Geronimo on 7/15/24.
//

import Foundation

/// The api call to specifically fetch Desserts
let API_DESSERTS = "https://themealdb.com/api/json/v1/1/filter.php?c=Dessert"

/// The api call to fetch a meal's full recipe. Needs the `idMeal` received from the `API_DESSERTS` call
let API_LOOKUP_MEAL_ID = "https://themealdb.com/api/json/v1/1/lookup.php?i="
