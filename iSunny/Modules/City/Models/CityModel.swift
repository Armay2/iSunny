//
//  CityModel.swift
//  iSunny
//
//  Created by Arnaud NOMMAY on 07/03/2023.
//

import Foundation
import CoreLocation

struct City: Codable, Hashable {
    let name: String
    let latitude: Double?
    let longitude: Double?
    var favorite = false
    
    static let exemple1 = City(name: "Paris", latitude: nil, longitude: nil)
    static let exemple2 = City(name: "Tokyo", latitude: nil, longitude: nil)
    static let exemple3 = City(name: "Toulouse", latitude: 43.604, longitude: 1.44305)
    static let exemples = [exemple1, exemple2, exemple3]
}
