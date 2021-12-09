//
//  RecetteView.swift
//  Gaspipa
//
//  Created by Etudiant on 09/12/2021.
//

import SwiftUI

struct RecetteIngredientRow: View {
    var ingredient: Ingredient
    
    var body: some View {
        HStack {
            Text(ingredient.aliment.libelle)
            Text("\(ingredient.quantité.quantité) \(ingredient.quantité.unité)")
        }
    }
}

struct RecetteView: View {
    
    @Binding var courses: Array<Ingredient>
    
    var recette: Recette
    
    var body: some View {
        
        List(recette.ingredients, id: \.self) {
            currentIngredient in RecetteIngredientRow(ingredient: currentIngredient)
        }
        /*List(recette.ingredients, id: \.self) {
            currentIngredient in RecetteIngredientRow(ingredient: currentIngredient)
        }*/
        Button("Ajouter les ingrédients aux courses") {
            validateForm(ingredients: recette.ingredients)
        }
    }
    
    func validateForm(ingredients: Array<Ingredient>) {
        
        courses = courses + ingredients
        saveJson(fileName: "courses.json", list: courses)
    }
}



//struct RecetteView_Previews: PreviewProvider {
//    static var previews: some View {
//        RecetteView()
//    }
//}
