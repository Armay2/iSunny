//
//  Endpoint.swift
//  iSunny
//
//  Created by Arnaud NOMMAY on 09/03/2023.
//

import Foundation

struct Endpoint <T: Decodable> {
    var path: String
    var type: T.Type
    var method = HTTPMethod.get
    var headers = [String: String]()
    var queryItems = [URLQueryItem]()
}

extension Endpoint where T == Weather {
    static func weather(latitude: Double, longitude: Double) -> Endpoint {
        let path = "/data/3.0/onecall" // ?lat=\(latitude)&lon=\(longitude)&APPID=\(appId)&units=metric"
        let queryItems = [
            URLQueryItem(name: "lat", value: String(latitude)),
            URLQueryItem(name: "lon", value: String(longitude)),
            URLQueryItem(name: "APPID", value: NetworkManager.APIKey),
            URLQueryItem(name: "units", value: "metric")
        ]
        return Endpoint(path: path, type: Weather.self, queryItems: queryItems)
    }
}
