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
            Text("\(ingredient.aliment.peremption.formatted(.iso8601.year().month().day().dateSeparator(.dash)))")
            Text("\(ingredient.quantité.quantité)")
        }
    }
}

struct RefrigerateurView: View {
    
    @Binding var frigo: Array<Ingredient>
        
    
    var body: some View {
        List(frigo) {
            currentAliment in FrigoRow(ingredient: currentAliment)
        }
    }
}
//
//struct Main_Previews: PreviewProvider {
//    static var previews: some View {
//        Group {
//            RefrigerateurView(frigo: [Ingredient]())
//        }
//    }
//}
