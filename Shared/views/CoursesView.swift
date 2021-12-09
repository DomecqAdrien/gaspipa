//
//  CoursesView.swift
//  Gaspipa
//
//  Created by Etudiant on 09/12/2021.
//

import SwiftUI

struct MyHeaderCourses: View {
    var body: some View {
        Text("Libellé")
        Text("Quantité")
    }
}

struct CoursesView: View {
    
    
    @Binding var courses: Array<Ingredient>
        
    
    var body: some View {
        List {
            MyHeaderCourses()
            ForEach(courses, id: \.self) {ingredient in
                Text(ingredient.aliment.libelle)
                Text("\(ingredient.quantité.quantité) \(ingredient.quantité.unité)")
            }
        }
    }
}

