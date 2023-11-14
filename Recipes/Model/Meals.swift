//
//  Meals.swift
//  Recipes
//
//  Created by Marco Mascorro on 11/13/23.
//

import Foundation

struct MealsResponse: Codable {
    let meals: [Meals]
}

struct Meals: Codable {
    var name: String
    var picture: String
    var id: String
    
    enum CodingKeys: String, CodingKey {
        case name = "strMeal"
        case picture = "strMealThumb"
        case id = "idMeal"
    }
}
