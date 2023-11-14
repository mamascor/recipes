//
//  MealView.swift
//  Recipes
//
//  Created by Marco Mascorro on 11/13/23.
//

import SwiftUI

struct MealView: View {
    
    @StateObject private var mvm: MealViewModel = MealViewModel()
    
    let mealId: String
    
    var body: some View {
        VStack {
            ScrollView(showsIndicators: false) {
                
                Section {
                    Text(mvm.meal?.strInstructions ?? "")
                } header: {
                    Text("Ingredients")
                        .font(.title)
                }
                
                HStack(alignment: .top) {
                    
                    VStack(alignment: .leading) {
                        Section {
                            StringEmptyView(text: mvm.meal?.strIngredient1 ?? "")
                            StringEmptyView(text: mvm.meal?.strIngredient2 ?? "")
                            StringEmptyView(text: mvm.meal?.strIngredient3 ?? "")
                            StringEmptyView(text: mvm.meal?.strIngredient4 ?? "")
                            StringEmptyView(text: mvm.meal?.strIngredient5 ?? "")
                            StringEmptyView(text: mvm.meal?.strIngredient6 ?? "")
                            StringEmptyView(text: mvm.meal?.strIngredient7 ?? "")
                            StringEmptyView(text: mvm.meal?.strIngredient8 ?? "")
                            StringEmptyView(text: mvm.meal?.strIngredient9 ?? "")
                            StringEmptyView(text: mvm.meal?.strIngredient10 ?? "")
                            StringEmptyView(text: mvm.meal?.strIngredient11 ?? "")
                            StringEmptyView(text: mvm.meal?.strIngredient12 ?? "")
                            StringEmptyView(text: mvm.meal?.strIngredient13 ?? "")
                            StringEmptyView(text: mvm.meal?.strIngredient14 ?? "")
                            StringEmptyView(text: mvm.meal?.strIngredient15 ?? "")
                            StringEmptyView(text: mvm.meal?.strIngredient16 ?? "")
                            StringEmptyView(text: mvm.meal?.strIngredient17 ?? "")
                            StringEmptyView(text: mvm.meal?.strIngredient18 ?? "")
                            StringEmptyView(text: mvm.meal?.strIngredient19 ?? "")
                            StringEmptyView(text: mvm.meal?.strIngredient20 ?? "")
                        } header: {
                            Text("Ingredients")
                                .bold()
                        }

                    }
                 
                    Spacer()
                    VStack(alignment: .leading) {
                        Section {
                            StringEmptyView(text: mvm.meal?.strMeasure1 ?? "")
                            StringEmptyView(text: mvm.meal?.strMeasure2 ?? "")
                            StringEmptyView(text: mvm.meal?.strMeasure3 ?? "")
                            StringEmptyView(text: mvm.meal?.strMeasure4 ?? "")
                            StringEmptyView(text: mvm.meal?.strMeasure5 ?? "")
                            StringEmptyView(text: mvm.meal?.strMeasure6 ?? "")
                            StringEmptyView(text: mvm.meal?.strMeasure7 ?? "")
                            StringEmptyView(text: mvm.meal?.strMeasure8 ?? "")
                            StringEmptyView(text: mvm.meal?.strMeasure9 ?? "")
                            StringEmptyView(text: mvm.meal?.strMeasure10  ?? "")
                            StringEmptyView(text: mvm.meal?.strMeasure11  ?? "")
                            StringEmptyView(text: mvm.meal?.strMeasure12  ?? "")
                            StringEmptyView(text: mvm.meal?.strMeasure13  ?? "")
                            StringEmptyView(text: mvm.meal?.strMeasure14  ?? "")
                            StringEmptyView(text: mvm.meal?.strMeasure15 ?? "")
                            StringEmptyView(text: mvm.meal?.strMeasure16  ?? "")
                            StringEmptyView(text: mvm.meal?.strMeasure17  ?? "")
                            StringEmptyView(text: mvm.meal?.strMeasure18  ?? "")
                            StringEmptyView(text: mvm.meal?.strMeasure19  ?? "")
                            StringEmptyView(text: mvm.meal?.strMeasure20  ?? "")
                        } header: {
                            Text("Measure")
                                .bold()
                        }

                    }
                    
                    Spacer()
                   
                }
                .frame(maxWidth: .infinity)
                .padding()
            }
            
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .navigationTitle(mvm.meal?.strMeal ?? "")
        .navigationBarTitleDisplayMode(.inline)
        .task {
            await mvm.getMeal(id: mealId)
        }
    }
    private func ingredientView(ingredient: String?) -> some View {
        Group {
            if let ingredient = ingredient {
                Text(ingredient)
            } else {
                EmptyView()
            }
        }
    }
}

#Preview {
    MealView(mealId: "53005")
}


struct StringEmptyView: View {
    let text: String
    var body: some View {
        if !text.isEmpty {
            Text(text)
        }
    }
}
