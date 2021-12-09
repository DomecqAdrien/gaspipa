//
//  RecetteView.swift
//  Gaspipa
//
//  Created by Etudiant on 09/12/2021.
//

import SwiftUI

struct RecetteRow: View {
    
    var recette: Recette
    
    var body: some View {
        Text(recette.titre)
    }
}

struct RecetteView: View {
    
    var recettes: Array<Recette>
    
    var body: some View {
        List(recettes) {
            currentRecette in RecetteRow(recette: currentRecette)
        }
    }
}