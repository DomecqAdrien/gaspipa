//
//  Ingredient.swift
//  Gaspipa
//
//  Created by Etudiant on 29/10/2021.
//

import Foundation

struct Ingredient: Identifiable, Codable, Hashable {
    static func == (lhs: Ingredient, rhs: Ingredient) -> Bool {
        return lhs.id == rhs.id && lhs.aliment == rhs.aliment && lhs.quantité == rhs.quantité
    }
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    var id: UUID? = UUID()
    var aliment: Aliment
    var quantité: Quantité
    
}
