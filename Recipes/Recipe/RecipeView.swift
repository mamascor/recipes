//
//  RecipeView.swift
//  Recipes
//
//  Created by Marco Mascorro on 11/13/23.
//

import SwiftUI


// RecipeView: Displays a list of meals using RecipeViewModel.
struct RecipeView: View {
    
    // ViewModel responsible for fetching and managing recipe data.
    @StateObject private var rvm: RecipeViewModel = RecipeViewModel()
    
    var body: some View {
        VStack {
            // Scrollable container for the list of meals.
            ScrollView(showsIndicators: false) {
                // Loop through the list of meals fetched by RecipeViewModel.
                ForEach(rvm.meals, id: \.id) { meal in
                    // Navigate to MealView when a meal is tapped.
                    NavigationLink {
                        MealView(mealId: meal.id)
                    } label: {
                        // Horizontal layout for each meal item.
                        HStack(alignment: .top) {
                            // Asynchronously load and display the meal's picture.
                            AsyncImage(url: URL(string: meal.picture)) { image in
                                image
                                    .resizable()
                                    .scaledToFit()
                            } placeholder: {
                                // Placeholder while the image is loading.
                                ProgressView()
                            }
                            .frame(width: 100, height:100)
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                            
                            // Vertical layout for meal details.
                            VStack {
                                // Display the meal's name.
                                Text(meal.name)
                            }
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                    }
                }
            }
            .padding(.horizontal)
        }
        .navigationTitle("Recipes") // Set the navigation title.
        .task {
            // Fetch recipes when the view is loaded.
            await rvm.getRecipes()
        }
    }
}

#Preview {
    RecipeView()
}
