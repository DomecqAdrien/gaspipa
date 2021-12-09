//
//  GaspipaApp.swift
//  Shared
//
//  Created by Etudiant on 29/10/2021.
//

import SwiftUI

@main
struct GaspipaApp: App {
    
    private var frigo = readJson(fileName: "frigo.json", type: [Ingredient].self, path: ".") ?? [Ingredient]()
    private var courses = readJson(fileName: "courses.json", type: [Ingredient].self, path: ".") ?? [Ingredient]()
    private var recettes = readJson(fileName: "recettes", type: [Recette].self, path: "resources") ?? [Recette]()
    
    var body: some Scene {
        WindowGroup {
            MenuView(frigo: frigo, courses: courses, recettes: recettes)
        }
    }
}

func saveJson<T: Codable>(fileName: String, list: Array<T>) {
    
    let encoder = JSONEncoder()
    encoder.dateEncodingStrategy = .iso8601
    let data = try? encoder.encode(list)
    
    guard let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {
        return }
    print(url)
    let fullUrl = url.appendingPathComponent(fileName)
    try? data?.write(to: fullUrl)
    
}

func readJson<T: Codable>(fileName: String, type: T.Type, path: String) -> T? {
    
    let url = getUrl(fileName: fileName, path: path)
    
    guard let data = try? Data(contentsOf: url!, options: .mappedIfSafe) else {
        return nil
    }
    
    print(data)
    
    let decoder = JSONDecoder()
    decoder.dateDecodingStrategy = .iso8601
    var decodedData: T?
    do {
        
        decodedData = try decoder.decode(type, from: data)

    } catch let error as NSError {
        print(error)
    }
    print(fileName)
    print(decodedData)

    return decodedData
}

func getUrl(fileName: String, path: String) -> URL? {
    if path == "resources" {
        return URL(fileURLWithPath: Bundle.main.path(forResource: fileName, ofType: "json") ?? "")
    } else {
        return (FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first ?? nil)?.appendingPathComponent(fileName)
    }
}
