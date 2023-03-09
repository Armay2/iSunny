//
//  NetworkManagerTests.swift
//  iSunnyTests
//
//  Created by Arnaud NOMMAY on 09/03/2023.
//

import Foundation

import XCTest
@testable import iSunny

class NetworkManagerTests: XCTestCase {
    
    let environment = AppEnvironment.production
    
    // MARK: - Test Fetch Weather Endpoint
    func testFetchWeatherEndpoint() async throws {
        // given
        let latitude = 37.7749
        let longitude = -122.4194
        
        // when
        let endpoint = Endpoint.weather(latitude: latitude, longitude: longitude)
        XCTAssertEqual(endpoint.path, "/data/3.0/onecall")
        XCTAssertEqual(endpoint.queryItems.count, 4)
        
        let manager = NetworkManager(environment: environment)
        let weather: Weather = try await manager.fetch(endpoint)
        
        // then
        XCTAssertEqual(weather.lat, latitude)
        XCTAssertEqual(weather.lon, longitude)
    }
    
    // MARK: - Test Weather Data Decoding
    func testWeatherDataDecoding() throws {
        // given
        let jsonString = """
        {
            "lat": 37.7749,
            "lon": -122.4194,
            "timezone": "America/Los_Angeles",
            "timezone_offset": -25200,
            "current": {
                "dt": 1646731095,
                "sunrise": 1646706255,
                "sunset": 1646748733,
                "temp": 18.69,
                "feels_like": 18.69,
                "pressure": 1012,
                "humidity": 72,
                "dew_point": 13.17,
                "uvi": 4.28,
                "clouds": 100,
                "visibility": 10000,
                "wind_speed": 0.89,
                "wind_deg": 0,
                "wind_gust": 1.77,
                "weather": [
                    {
                        "id": 804,
                        "main": "Clouds",
                        "description": "overcast clouds",
                        "icon": "04n"
                    }
                ]
            }
        }
        """
        let jsonData = jsonString.data(using: .utf8)!
        let decoder = JSONDecoder()
        
        // when
        let weather = try decoder.decode(Weather.self, from: jsonData)
        
        // then
        XCTAssertEqual(weather.lat, 37.7749)
        XCTAssertEqual(weather.lon, -122.4194)
        XCTAssertEqual(weather.timezone, "America/Los_Angeles")
        XCTAssertEqual(weather.current?.weather?.first?.weatherDescription, "overcast clouds")
    }
    
    // MARK: - Test Fetch Weather Endpoint With Retry
    func testFetchWeatherEndpointWithRetry() async throws {
        // given
        let endpoint = Endpoint.weather(latitude: 37.7749, longitude: -122.4194)
        let manager = NetworkManager(environment: environment)
        
        // when
        let weather: Weather = try await manager.fetch(endpoint, attempts: 3)
        
        // Ajoutez des assertions appropriées ici
        XCTAssertNotNil(weather)
    }
}
