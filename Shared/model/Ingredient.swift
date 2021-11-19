//
//  Ingredient.swift
//  Gaspipa
//
//  Created by Etudiant on 29/10/2021.
//

import Foundation
struct Ingredient: Identifiable, Codable {
    var id = UUID()
    var aliment: Aliment
    var quantité: Quantité
    
}
