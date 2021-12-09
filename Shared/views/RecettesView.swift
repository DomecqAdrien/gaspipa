//
//  RecetteView.swift
//  Gaspipa
//
//  Created by Etudiant on 09/12/2021.
//

import SwiftUI

struct RecetteRow: View {
    
    
    @Binding var courses: Array<Ingredient>
    
    var recette: Recette
    
    var body: some View {
        NavigationLink(destination: RecetteView(courses: $courses, recette: recette)) {
            Text(recette.titre)
        }
    }
}

struct RecettesView: View {
    
    @Binding var courses: Array<Ingredient>
    
    var recettes: Array<Recette>
    
    var body: some View {
        List(recettes) {
            currentRecette in RecetteRow(courses: $courses, recette: currentRecette)
        }
    }
}
