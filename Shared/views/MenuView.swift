//
//  MenuView.swift
//  Gaspipa
//
//  Created by Etudiant on 29/10/2021.
//

import SwiftUI

struct MenuView: View {
    var body: some View {
        TabView {
            NavigationView {
                RefrigerateurView(
                    frigo: [
                        Aliment(libelle: "Tomate", quantité: 3, peremption: Date(), categorie: "Fruit", allergènes: Array()),
                        Aliment(libelle: "Salade", quantité: 1, peremption: Date(), categorie: "Fruit", allergènes: Array())
                    ]
                ).navigationTitle("Réfrigérateur")
            }.tabItem {
                Image(systemName: "airpods.chargingcase.fill")
                Text("Réfrigérateur")
            }
            
            Text("Tab Content 2")
                .tabItem {
                    Image(systemName: "fork.knife")
                    Text("Recettes")
                }
            Text("Tab Content 2")
                .tabItem {
                    Image(systemName: "cart")
                    Text("Courses")
                }
            Text("Tab Content 2")
                .tabItem {
                    Image(systemName: "gearshape")
                    Text("Paramètres")
                }
        }
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
            .previewInterfaceOrientation(.portrait)
    }
}

