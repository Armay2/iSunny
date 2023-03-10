//
//  NetworkManager.swift
//  iSunny
//
//  Created by Arnaud NOMMAY on 09/03/2023.
//

import Foundation

struct NetworkManager {
    var environment: AppEnvironment
    static let APIKey = ""
    
    /// A function that fetches data from an endpoint.
    /// - Parameters:
    ///   - resource: The endpoint to fetch data from
    ///   - data:  Optional data to include in the request body.
    ///   - attempts: The number of times to attempt the request before throwing an error.
    ///   - retryDelay: The delay in seconds between each retry attempt.
    /// - Returns:  The fetched data of type `T`
    func fetch<T>(_ resource: Endpoint<T>, with data: Data? = nil) async throws -> T {
        guard let url = URL(string: resource.path, relativeTo: environment.baseURL) else  {
            throw URLError(.unsupportedURL)
        }
        
        var completUrl = URLComponents(url: url, resolvingAgainstBaseURL: true)
        completUrl?.queryItems = resource.queryItems
        
        print("complet \(completUrl?.url?.absoluteString ?? "no")")
        
        guard let buildURL = completUrl?.url else {
            throw URLError(.unsupportedURL)
        }
        
        var request = URLRequest(url: buildURL)
        request.httpMethod = resource.method.rawValue
        request.httpBody = data
        request.allHTTPHeaderFields = resource.headers
        
        let (data, _) = try await environment.session.data(for: request)
        
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    }
    
    /// A function that fetches data from an endpoint, with the option to retry if the request fails.
    /// - Parameters:
    ///   - resource: The endpoint to fetch data from
    ///   - data:  Optional data to include in the request body.
    ///   - attempts: The number of times to attempt the request before throwing an error.
    ///   - retryDelay: The delay in seconds between each retry attempt.
    /// - Returns:  The fetched data of type `T`
    func fetch<T>(_ resource: Endpoint<T>, with data: Data? = nil, attempts: Int, retryDelay: Double = 1) async throws -> T {
        do {
            print("Attempting to fetch (Attempts remaining: \(attempts)")
            return try await fetch(resource, with: data)
        } catch {
            if attempts > 1 {
                try await Task.sleep(for: .milliseconds(Int(retryDelay * 1000)))
                return try await fetch(resource, with: data, attempts: attempts - 1, retryDelay: retryDelay)
            } else {
                throw error
            }
        }
    }
}
