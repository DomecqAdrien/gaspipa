//
//  GaspipaApp.swift
//  Shared
//
//  Created by Etudiant on 29/10/2021.
//

import SwiftUI

@main
struct GaspipaApp: App {
    
    @State private var frigo = readJson() ?? [Ingredient]()
    
    var body: some Scene {
        WindowGroup {
            MenuView()
        }
    }
}

func saveJson(from newIngredient: Ingredient) {
    
    var ingredients = readJson() ?? [Ingredient]()
    ingredients.append(newIngredient)
    
    
    let encoder = JSONEncoder()
    encoder.dateEncodingStrategy = .iso8601
    let data = try? encoder.encode(ingredients)
    
    guard let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {
        return }
    print(url)
    let fullUrl = url.appendingPathComponent("frigo.json")
    try? data?.write(to: fullUrl)
    
}

func readJson() -> Array<Ingredient>? {
    
    guard let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {
        return nil}
    let fullUrl = url.appendingPathComponent("frigo.json")
    
    guard let data = try? Data(contentsOf: fullUrl) else {
        return nil
    }
    
    let decoder = JSONDecoder()
    decoder.dateDecodingStrategy = .iso8601
    let decodedData = try? decoder.decode([Ingredient].self, from: data)

    return decodedData
}
