//
//  AddAliment.swift
//  Gaspipa
//
//  Created by Etudiant on 19/11/2021.
//

import SwiftUI

struct AddAliment: View {
    
    
        
    @State private var unité: Unités = .gramme
    @State private var libellé: String = ""
    @State private var quantité: Int?
    @State private var catégorie: Catégories = .legume
    @State private var date: Date = Date()
    @Binding var close: Bool
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Libellé", text: $libellé)
                TextField("Quantité", value: $quantité, format: .number, prompt: nil)
                    .keyboardType(UIKeyboardType.decimalPad)
                Picker(selection: $unité, label: Text("Unité")) {
                    ForEach(Unités.allCases, id: \.self) { value in
                        Text(value.rawValue).tag(value)
                    }
                }
                DatePicker("Date", selection: $date, displayedComponents: .date)
                Picker(selection: $catégorie, label: Text("Catégorie")) {
                    ForEach(Catégories.allCases, id: \.self) { value in
                        Text(value.rawValue).tag(value)
                    }
                }
                
                
                Button("Valider") {
                    validateForm(unité: unité, libellé: libellé, quantité: quantité, catégorie: catégorie, date: date)
                }
            }.navigationTitle("Ajouter un ingrédient")
        }
        
    }
    
    func validateForm(unité: Unités, libellé: String, quantité: Int?, catégorie: Catégories, date: Date) {
        
        if let unwrappedQuantité = quantité {
            let newQuantité = Quantité(quantité: unwrappedQuantité, unité: unité.rawValue)
            let aliment = Aliment(libelle: libellé, peremption: date, categorie: catégorie.rawValue)
            let ingredient = Ingredient(aliment: aliment, quantité: newQuantité)
            saveJson(from: ingredient)
            close = false
        }
    }
}

enum Unités: String, Hashable, CaseIterable {
    case cas = "Cuillère à soupe"
    case cac = "Cuillère à pafé"
    case gramme = "Grammes"
}

enum Catégories: String, Hashable, CaseIterable {
    case legume = "Légume"
    case fruit = "Fruit"
    case viande = "Viande"
    case poisson = "Poisson"
    case cereale = "Céréale"
    case autre = "Autre"
}







struct AddAliment_Previews: PreviewProvider {
    static var previews: some View {
        AddAliment(close: .constant(true))
    }
}
