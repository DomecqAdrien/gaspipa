//
//  MenuView.swift
//  Gaspipa
//
//  Created by Etudiant on 29/10/2021.
//

import SwiftUI

struct MenuView: View {
    
    @State private var add: Bool = false
    @State var frigo: Array<Ingredient>
    @State var courses: Array<Ingredient>
    var recettes: Array<Recette>
    
    var body: some View {
        VStack {
            TabView {
                NavigationView {
                    RefrigerateurView(frigo: $frigo).navigationTitle("Réfrigérateur")
                        .toolbar {
                            Button(action: {add = true}) {
                                Image(systemName: "plus")
                            }
                        }
                        .sheet(isPresented: $add) {
                            AddAliment(close: $add , frigo: $frigo)
                        }
                    
                }.tabItem {
                    Image(systemName: "airpods.chargingcase.fill")
                    Text("Réfrigérateur")
                }
                
                NavigationView {
                    RecetteView(recettes: recettes).navigationTitle("Recettes")
                }
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
}

//struct MenuView_Previews: PreviewProvider {
//    static var previews: some View {
//        MenuView()
//            .previewInterfaceOrientation(.portrait)
//    }
//}

