//
//  LocationManager.swift
//  iSunny
//
//  Created by Arnaud NOMMAY on 07/03/2023.
//

import SwiftUI
import MapKit
import CoreLocation

class LocationManager: NSObject, ObservableObject {
    enum LocationStatus: Equatable {
        case idle
        case noResults
        case isSearching
        case error(String)
        case result
    }
    
    private let searchCompleter = MKLocalSearchCompleter()
    private let geocoder = CLGeocoder()

    @Published var searchResults: [MKLocalSearchCompletion] = []
//    @Published var selectedLocation: CLLocation?
    @Published var selectedCity: City?
    @Published private(set) var status: LocationStatus = .idle
    
    override init() {
        super.init()
        searchCompleter.delegate = self
    }

    func search(for searchText: String) {
        self.status = .isSearching
        if !searchText.isEmpty {
            searchCompleter.queryFragment = searchText
        } else {
            self.status = .idle
        }
    }

    func geocodeAndSetLocation(for placemarkTitle: String) {
        geocoder.geocodeAddressString(placemarkTitle) { placemarks, error in
            if let placemark = placemarks?.first {
//                self.selectedLocation = placemark.location
                self.selectedCity = City(name: placemarkTitle, latidude:  placemark.location?.coordinate.latitude, longitude: placemark.location?.coordinate.longitude)
            } else {
                self.status = .error("get location from address")
            }
        }
    }
}

extension LocationManager: MKLocalSearchCompleterDelegate {
    func completerDidUpdateResults(_ completer: MKLocalSearchCompleter) {
        searchResults = completer.results
        self.status = completer.results.isEmpty ? .noResults : .result

    }

    func completer(_ completer: MKLocalSearchCompleter, didFailWithError error: Error) {
        self.status = .error(error.localizedDescription)
    }
}
