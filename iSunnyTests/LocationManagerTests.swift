//
//  LocationManagerTests.swift
//  iSunnyTests
//
//  Created by Arnaud NOMMAY on 09/03/2023.
//

import XCTest
import MapKit
import Combine

@testable import iSunny

class LocationManagerTests: XCTestCase {

    // MARK: - Test search method with empty text
    func testSearchWithEmptyText() {
        // given
        let locationManager = LocationManager()
        
        // when
        locationManager.search(for: "")
        
        // then
        XCTAssertEqual(locationManager.status, .idle)
    }
    
    // MARK: - Test search method with non-empty text
    func testSearchWithNonEmptyText() {
        // given
        let locationManager = LocationManager()
        
        // when
        locationManager.search(for: "Paris")
        
        // then
        XCTAssertEqual(locationManager.status, .isSearching)
    }
    
    // MARK: - Test search results
       func testSearchResults() {
           // given
           let locationManager = LocationManager()
           let expectation = XCTestExpectation(description: "Search results received")
           
           // when
           locationManager.search(for: "Paris")
           
           // then
           DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
               XCTAssertFalse(locationManager.searchResults.isEmpty)
               expectation.fulfill()
           }
           
           wait(for: [expectation], timeout: 3)
       }
       
       // MARK: - Test geocode and set location for a valid address
       func testGeocodeAndSetLocationWithValidAddress() {
           // given
           let locationManager = LocationManager()
           let expectation = XCTestExpectation(description: "Location received")
           
           // when
           locationManager.geocodeAndSetLocation(for: "Paris, France")
           
           // then
           DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
               XCTAssertEqual(locationManager.status, .result)
               XCTAssertNotNil(locationManager.selectedCity?.latitude)
               XCTAssertNotNil(locationManager.selectedCity?.longitude)
               expectation.fulfill()
           }
           
           wait(for: [expectation], timeout: 3)
       }
       
       // MARK: - Test geocode and set location error
       func testGeocodeAndSetLocationWithError() {
           // given
           let locationManager = LocationManager()
           let expectation = XCTestExpectation(description: "Error received")
           
           // when
           locationManager.geocodeAndSetLocation(for: "NotWorking-asdhfgajkshdfbhlasdkflahb")
           
           // then
           DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
               XCTAssertEqual(locationManager.status, .error("get location from address"))
               expectation.fulfill()
           }
           
           wait(for: [expectation], timeout: 3)
       }
}
