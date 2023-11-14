//
//  MealViewModel.swift
//  Recipes
//
//  Created by Marco Mascorro on 11/13/23.
//

import Foundation


class MealViewModel: ObservableObject {
    
    // Published property to notify views of changes in the selected meal.
    @Published var meal: Meal?
    
    // Published property to store the list of ingredients for the meal.
    @Published var ingredients: [String] = []
    
    // Asynchronously fetch details for the specified meal ID.
    func getMeal(id: String) async {
        do {
            // Define the API endpoint for fetching meal details.
            let url = URL(string: "https://themealdb.com/api/json/v1/1/lookup.php?i=\(id)")!
            
            // Fetch data from the specified URL using URLSession.
            let (data, _) = try await URLSession.shared.data(from: url)
            
            // Decode the JSON response into a MealResponse object.
            let meal = try JSONDecoder().decode(MealResponse.self, from: data)
            
            // Update the selected meal on the main thread.
            DispatchQueue.main.async {
                self.meal = meal.meals.first
            }
        } catch {
            print(error)
        }
    }
}
