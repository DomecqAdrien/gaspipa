//
//  Recette.swift
//  Gaspipa
//
//  Created by Etudiant on 29/10/2021.
// 

import Foundation
struct Recette: Codable {
    private var titre: String
    private var duree: Int
    private var niveau: String
    private var nbPersonne: Int
    private var ingredients: Array<Ingredient>
    private var etapes: Array<Etape>
    private var tags: Array<String>
    
    private var isLiked: Bool
    
}
