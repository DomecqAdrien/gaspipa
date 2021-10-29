//
//  Main.swift
//  Gaspipa
//
//  Created by Etudiant on 29/10/2021.
//

import SwiftUI

struct FrigoRow: View {
    var aliment: Aliment
    
    var body: some View {
        HStack {
            Text(aliment.libelle)
            Text("\(aliment.peremption.formatted(.iso8601.year().month().day().dateSeparator(.dash)))")
        }
    }
}

struct RefrigerateurView: View {
    
    var frigo: Array<Aliment>
    
    var body: some View {
        
        List(frigo) {
            currentAliment in FrigoRow(aliment: currentAliment)
        }
    }
}

struct Main_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            RefrigerateurView(frigo: [
                Aliment(libelle: "Tomate", quantité: 3, peremption: Date(), categorie: "Fruit", allergènes: Array()),
                Aliment(libelle: "Salade", quantité: 1, peremption: Date(), categorie: "Fruit", allergènes: Array())
            ])
        }
    }
}
