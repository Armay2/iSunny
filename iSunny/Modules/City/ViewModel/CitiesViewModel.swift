//
//  CitiesViewModel.swift
//  iSunny
//
//  Created by Arnaud NOMMAY on 14/03/2023.
//

import Foundation

@MainActor class CitiesViewModel: ObservableObject {
    @Published var cities: [City]
    static private let savingKey = "SavedCitys"
    
    init() {
        if let data = UserDefaults.standard.data(forKey: CitiesViewModel.savingKey) {
            if let decoded = try? JSONDecoder().decode([City].self, from: data) {
                cities = decoded
                return
            }
        }
        cities = []
    }
    
    func save() {
        if let encoded = try? JSONEncoder().encode(cities) {
            UserDefaults.standard.set(encoded, forKey: CitiesViewModel.savingKey)
        }
    }
    
    func addNewCity(_ city: City) {
        objectWillChange.send()
        cities.append(city)
        self.save()
    }
    
    func deleteCity(at offsets: IndexSet) {
        objectWillChange.send()
        cities.remove(atOffsets: offsets)
        self.save()
    }
}
