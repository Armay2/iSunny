//
//  MainView.swift
//  iSunny
//
//  Created by Arnaud NOMMAY on 07/03/2023.
//

import SwiftUI

struct CitiesView: View {
    @State private var cities = City.exemples
    @State private var isPresentedAddCityView = false
    
    var body: some View {
        NavigationStack {
            List($cities, id: \.self, editActions: .move) { $city in
                NavigationLink(city.name, value: city)
            }
            .navigationDestination(for: City.self) { city in
                CityDetailView(city: city)
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
                    cities.append(city)
                }
            }
//            .environment(\.editMode, Binding.constant(EditMode.active))
        }
    }
    
    func move(from source: IndexSet, to destination: Int) {
        cities.move(fromOffsets: source, toOffset: destination)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        CitiesView()
    }
}
