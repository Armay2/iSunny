//
//  SearchCityView.swift
//  iSunny
//
//  Created by Arnaud NOMMAY on 07/03/2023.
//

import SwiftUI

struct SearchCityView: View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject var locationManager = LocationManager()
    @State private var searchText: String = ""

    let onSelect: (City?) -> ()
    
    var body: some View {
        NavigationStack {
            List(locationManager.searchResults, id: \.self) { city in
                VStack {
                    Text(city.title).font(.headline)
                    Text(city.title).font(.caption)
                }
                .onTapGesture {
                    locationManager.geocodeAndSetLocation(for: city.title)
                }
            }.navigationTitle("Search for city")
        }
        .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always))
        .onChange(of: searchText) { _ in
            locationManager.search(for: searchText)
        }
        .onChange(of: locationManager.selectedCity) { city in
            onSelect(locationManager.selectedCity)
            dismiss()
        }
        
    }
}

#if DEBUG
struct SearchCityView_Previews: PreviewProvider {
    static var previews: some View {
        SearchCityView(onSelect: { _ in print("onSelectCity") })
    }
}
#endif
