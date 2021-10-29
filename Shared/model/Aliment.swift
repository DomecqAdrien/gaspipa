//
//  Aliment.swift
//  Gaspipa
//
//  Created by Etudiant on 29/10/2021.
//

import Foundation
struct Aliment: Identifiable {
    var id = UUID()
    var libelle: String
    var quantité: Int
    var peremption: Date
    var categorie: String
    var allergènes: Array<String>
}
