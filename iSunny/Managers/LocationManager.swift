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
    
    /// Location Manager search status
    enum LocationStatus: Equatable {
        case idle
        case noResults
        case isSearching
        case error(String)
        case result
    }
    
    // MARK: Properties
    private let searchCompleter = MKLocalSearchCompleter()
    private let geocoder = CLGeocoder()

    @Published var searchResults: [MKLocalSearchCompletion] = []
    @Published var selectedCity: City?
    @Published private(set) var status: LocationStatus = .idle
    
    // MARK: Initialization
    override init() {
        super.init()
        searchCompleter.delegate = self
    }
    
    // MARK: Methods
    /// Initiates a search for a given search text string
    /// - Parameter searchText: The text to search for.
    func search(for searchText: String) {
        self.status = .isSearching
        if !searchText.isEmpty {
            searchCompleter.queryFragment = searchText
        } else {
            self.status = .idle
        }
    }

    
    /// Geocodes a given placemark title and sets the selected city's location based on the geocoded results.
    /// - Parameter placemarkTitle: <#placemarkTitle description#>
    func geocodeAndSetLocation(for placemarkTitle: String) {
        geocoder.geocodeAddressString(placemarkTitle) { placemarks, error in
            if let placemark = placemarks?.first {
                self.selectedCity = City(name: placemarkTitle, latitude: placemark.location?.coordinate.latitude, longitude: placemark.location?.coordinate.longitude)
                self.status = .result
            } else {
                self.status = .error("get location from address")
            }
        }
    }
}

// MARK: Extension MKLocalSearchCompleterDelegate
extension LocationManager: MKLocalSearchCompleterDelegate {
    func completerDidUpdateResults(_ completer: MKLocalSearchCompleter) {
        searchResults = completer.results
        self.status = completer.results.isEmpty ? .noResults : .result

    }

    func completer(_ completer: MKLocalSearchCompleter, didFailWithError error: Error) {
        self.status = .error(error.localizedDescription)
    }
}
