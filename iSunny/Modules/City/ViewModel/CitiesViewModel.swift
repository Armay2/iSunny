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
    
    /// Save the currents city in UserDefaults
    func save() {
        if let encoded = try? JSONEncoder().encode(cities) {
            UserDefaults.standard.set(encoded, forKey: CitiesViewModel.savingKey)
        }
    }
    
    /// Add a city to cities list, and update offline storage
    /// - Parameter city: New city to be added in the list
    func addNewCity(_ city: City) {
        objectWillChange.send()
        cities.append(city)
        self.save()
    }
    
    /// Delete a city from cities list, and update offline storage
    /// - Parameter offsets: City to be deleted from the list
    func deleteCity(at offsets: IndexSet) {
        objectWillChange.send()
        cities.remove(atOffsets: offsets)
        self.save()
    }
}
