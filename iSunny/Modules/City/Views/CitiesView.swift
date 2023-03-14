//
//  MainView.swift
//  iSunny
//
//  Created by Arnaud NOMMAY on 07/03/2023.
//

import SwiftUI

struct CitiesView: View {
    @State private var isPresentedAddCityView = false
    @StateObject var citiesVM = CitiesViewModel()

    var body: some View {
        NavigationStack {
            
            if citiesVM.cities.isEmpty {
                HStack {
                    Text("Please add a new city")
                    Image(systemName: "arrow.up.right")
                }.padding()
            }
            
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

#if DEBUG
struct CitiesView_Previews: PreviewProvider {
    static var previews: some View {
        CitiesView()
    }
}
#endif


