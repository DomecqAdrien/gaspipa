//
//  Aliment.swift
//  Gaspipa
//
//  Created by Etudiant on 29/10/2021.
//

import Foundation
struct Aliment: Identifiable, Codable {
    var id: UUID? = UUID()
    var libelle: String
    var peremption: Date?
    var categorie: String?
    var allergènes: Array<String>?
}
