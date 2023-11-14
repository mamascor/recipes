//
//  RecipeViewModel.swift
//  Recipes
//
//  Created by Marco Mascorro on 11/13/23.
//

import Foundation
import UIKit

// RecipeViewModel: Handles fetching and managing recipe data.
class RecipeViewModel: ObservableObject {
    
    // Published property to notify views of changes in the list of meals.
    @Published var meals: [Meals] = []
    
    // Asynchronously fetch recipes for the "Dessert" category.
    func getRecipes() async {
        do {
            // Define the API endpoint for fetching dessert recipes.
            let url = URL(string: "https://themealdb.com/api/json/v1/1/filter.php?c=Dessert")!
            
            // Fetch data from the specified URL using URLSession.
            let (data, _) = try await URLSession.shared.data(from: url)
            
            // Decode the JSON response into a MealsResponse object.
            let meals = try JSONDecoder().decode(MealsResponse.self, from: data)
            
            // Filter out meals with empty name, picture, and ID.
            let filteredMeals = meals.meals.filter { meal in
                return !meal.name.isEmpty && !meal.picture.isEmpty && !meal.id.isEmpty
            }
            
            // Update the published property on the main thread.
            DispatchQueue.main.async {
                self.meals = filteredMeals
            }
        } catch {
            // Print any errors that occur during the fetch operation.
            print(error)
        }
    }
}
