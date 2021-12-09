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
            Text("\(ingredient.quantité.quantité)")
        }
    }
}

struct RecetteView: View {
    var recette: Recette
    
    var body: some View {
        
        List(recette.ingredients, id: \.self) {
            currentIngredient in RecetteIngredientRow(ingredient: currentIngredient)
        }
    }
}

//struct RecetteView_Previews: PreviewProvider {
//    static var previews: some View {
//        RecetteView()
//    }
//}
