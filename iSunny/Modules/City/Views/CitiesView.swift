//
//  MainView.swift
//  iSunny
//
//  Created by Arnaud NOMMAY on 07/03/2023.
//

import SwiftUI

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


struct CitiesView: View {
//    @State private var cities = City.exemples
    @State private var isPresentedAddCityView = false
    @StateObject var citiesVM = CitiesViewModel()

    var body: some View {
        NavigationStack {
            List($citiesVM.cities, id: \.self, editActions: .delete) { $city in
                NavigationLink(city.name, value: city)
            }
            .navigationDestination(for: City.self) { city in
                CityDetailsView(city: city)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        isPresentedAddCityView.toggle()
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $isPresentedAddCityView) {
                SearchCityView { city in
                    guard let city = city else {
                        print("no city")
                        return
                    }
                    citiesVM.addNewCity(city)
                }
            }
            .navigationTitle("Cities")
        }
    }
    
    func delete(at offsets: IndexSet) {
        citiesVM.deleteCity(at: offsets)
    }

}

struct CitiesView_Previews: PreviewProvider {
    static var previews: some View {
        CitiesView()
    }
}
