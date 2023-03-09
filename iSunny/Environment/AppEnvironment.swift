//
//  AppEnvironment.swift
//  iSunny
//
//  Created by Arnaud NOMMAY on 09/03/2023.
//

import Foundation

struct AppEnvironment {
    var name: String
    var baseURL: URL
    var session: URLSession
    
    static let production = AppEnvironment (
        name: "Production", baseURL: URL(string: "https://api.openweathermap.org")!,
        session: {
            let configuration = URLSessionConfiguration.default
            return URLSession(configuration: configuration)
        }()
    )
}

