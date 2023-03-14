//
//  Endpoint.swift
//  iSunny
//
//  Created by Arnaud NOMMAY on 09/03/2023.
//

import Foundation

/// A struct that represents an API endpoint for fetching data of type T.
/// - Parameters:
///     - path: The path to the endpoint.
///     - type: The type of data to be returned from the endpoint.
///     - method: The `HTTPMethod` used to make the request.
///     - headers: The HTTP headers to be included in the request.
///     - queryItems: The `URLQueryItem` to be included in the request URL.
struct Endpoint <T: Decodable> {
    var path: String
    var type: T.Type
    var method = HTTPMethod.get
    var headers = [String: String]()
    var queryItems = [URLQueryItem]()
}

///A function that returns an endpoint for fetching `Weather` data from the OpenWeather API.
/// - Parameters:
///     - latitude: The latitude of the location to fetch weather data for.
///     - longitude: The longitude of the location to fetch weather data for.
/// - Returns: An `Endpoint`.
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
