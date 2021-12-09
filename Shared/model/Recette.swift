//
//  Recette.swift
//  Gaspipa
//
//  Created by Etudiant on 29/10/2021.
// 

import Foundation
struct Recette: Identifiable, Codable {
    var id: UUID? = UUID()
    var titre: String
    var duree: Int
    var niveau: String
    var nbPersonne: Int
    var ingredients: Array<Ingredient>
    var etapes: Array<Etape>
    var tags: Array<String>
    
    var isLiked: Bool
    
}
