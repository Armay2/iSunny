//
//  CityModel.swift
//  iSunny
//
//  Created by Arnaud NOMMAY on 07/03/2023.
//

import Foundation
import CoreLocation

struct City: Hashable {
    let name: String
    let location: CLLocation?
    var favorite = false
    
    
    static let exemple1 = City(name: "Paris", location: nil)
    static let exemple2 = City(name: "Tokyo", location: nil)
    static let exemple3 = City(name: "Toulouse", location: CLLocation(latitude: 43.604, longitude: 1.44305))
    static let exemples = [exemple1, exemple2, exemple3]
}
