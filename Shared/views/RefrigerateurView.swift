//
//  Main.swift
//  Gaspipa
//
//  Created by Etudiant on 29/10/2021.
//

import SwiftUI

struct FrigoRow: View {
    
    var ingredient: Ingredient
    
    
    var body: some View {
        HStack {
            
            Text(ingredient.aliment.libelle)
            Text("\(ingredient.aliment.peremption!.formatted(.iso8601.year().month().day().dateSeparator(.dash)))")
            Text("\(ingredient.quantité.quantité)")
        }
    }
}

struct MyHeader: View {
    var body: some View {
        HStack {
            Text("Libellé      ")
            Text("Date de péremption     ")
            Text("Quantité")
        }
    }
}

struct RefrigerateurView: View {
    
    @Binding var frigo: Array<Ingredient>
        
    
    var body: some View {
        List {
            MyHeader()
            ForEach(frigo, id: \.self) {ingredient in
                HStack{
                    Text(ingredient.aliment.libelle)
                    Text("     \(ingredient.aliment.peremption!.formatted(.iso8601.year().month().day().dateSeparator(.dash)))")
                    Text("     \(ingredient.quantité.quantité) \(ingredient.quantité.unité)")
                }
                
            }
        }
//        VStack{
//            HStack {
//                Text("libelle")
//                Text("peremption")
//                Text("quantite")
//            }
//            List(frigo) {
//                currentAliment in FrigoRow(ingredient: currentAliment)
//            }
//        }
        
    }
}

//struct Main_Previews: PreviewProvider {
//    static var previews: some View {
//        Group {
//            RefrigerateurView(frigo: [Ingredient]())
//        }
//    }
//}
