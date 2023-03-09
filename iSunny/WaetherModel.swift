//
//  WaetherModel.swift
//  iSunny
//
//  Created by Arnaud NOMMAY on 08/03/2023.
//

import Foundation

import Foundation

// MARK: - Weather
struct Weather: Decodable {
    let lat: Double?
    let lon: Double?
    let timezone: String?
    let timezoneOffset: Int?
    let current: Current?
    let minutely: [Minutely]?
    let hourly: [Current]?
    let daily: [Daily]?
    let alerts: [Alert]?

    enum CodingKeys: String, CodingKey {
        case lat = "lat"
        case lon = "lon"
        case timezone = "timezone"
        case timezoneOffset = "timezone_offset"
        case current = "current"
        case minutely = "minutely"
        case hourly = "hourly"
        case daily = "daily"
        case alerts = "alerts"
    }
    static let `default` = Weather(lat: 48.8667, lon: 2.3333, timezone: "Europe/Paris", timezoneOffset: 3600,
                                   current: Current(dt: 1678284375, sunrise: 1678256378, sunset: 1678297424, temp: 12.66, feelsLike: 12.41, pressure: 991, humidity: 93, dewPoint: 11.56, uvi: 0.1, clouds: 100, visibility: 10000, windSpeed: 8.75, windDeg: 230, windGust:  13.89, weather: [WeatherElement(id: 500, main: "Clouds", weatherDescription: "broken clouds", icon: "04d")], pop: 0, rain: Rain(the1H: 0.51)), minutely: [Minutely(dt: 1678290060, precipitation: 0.5128)], hourly: nil, daily: nil, alerts: [Alert(senderName: "METEO-FRANCE", event: "Moderate wind warning", start: 1678266059, end: 1678316400, description: "Moderate damages may occur, especially in vulnerable or in exposed areas and to people who carry out weather-related activities.", tags: ["Wind"])])
}

// MARK: - Alert
struct Alert: Decodable, Hashable {
    let senderName: String?
    let event: String?
    let start: Int?
    let end: Int?
    let description: String?
    let tags: [String]?

    enum CodingKeys: String, CodingKey {
        case senderName = "sender_name"
        case event = "event"
        case start = "start"
        case end = "end"
        case description = "description"
        case tags = "tags"
    }
}

// MARK: - Current
struct Current: Decodable {
    let dt: Int?
    let sunrise: Int?
    let sunset: Int?
    let temp: Double?
    let feelsLike: Double?
    let pressure: Int?
    let humidity: Int?
    let dewPoint: Double?
    let uvi: Double?
    let clouds: Int?
    let visibility: Int?
    let windSpeed: Double?
    let windDeg: Int?
    let windGust: Double?
    let weather: [WeatherElement]?
    let pop: Double?
    let rain: Rain?

    enum CodingKeys: String, CodingKey {
        case dt = "dt"
        case sunrise = "sunrise"
        case sunset = "sunset"
        case temp = "temp"
        case feelsLike = "feels_like"
        case pressure = "pressure"
        case humidity = "humidity"
        case dewPoint = "dew_point"
        case uvi = "uvi"
        case clouds = "clouds"
        case visibility = "visibility"
        case windSpeed = "wind_speed"
        case windDeg = "wind_deg"
        case weather = "weather"
        case windGust = "wind_gust"
        case pop = "pop"
        case rain = "rain"
    }
}

// MARK: - Rain
struct Rain: Decodable {
    let the1H: Double?

    enum CodingKeys: String, CodingKey {
        case the1H = "1h"
    }
}

// MARK: - WeatherElement
struct WeatherElement: Decodable {
    let id: Int?
    let main: String? //TODO: Enum
    let weatherDescription: String? //TODO: Enum
    let icon: String?  //TODO: Enum

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case main = "main"
        case weatherDescription = "description"
        case icon = "icon"
    }
}

//enum Description: String, Decodable {
//    case brokenClouds = "broken clouds"
//    case lightRain = "light rain"
//    case moderateRain = "moderate rain"
//    case overcastClouds = "overcast clouds"
//    case rainAndSnow = "rain and snow"
//}
//
//enum Icon: String, Decodable {
//    case the04D = "04d"
//    case the04N = "04n"
//    case the10D = "10d"
//    case the10N = "10n"
//    case the13D = "13d"
//}

enum Main: String, Decodable {
    case clouds = "Clouds"
    case rain = "Rain"
    case snow = "Snow"
}

// MARK: - Daily
struct Daily: Decodable {
    let dt: Int?
    let sunrise: Int?
    let sunset: Int?
    let moonrise: Int?
    let moonset: Int?
    let moonPhase: Double?
    let temp: Temp?
    let feelsLike: FeelsLike?
    let pressure: Int?
    let humidity: Int?
    let dewPoint: Double?
    let windSpeed: Double?
    let windDeg: Int?
    let windGust: Double?
    let weather: [WeatherElement]?
    let clouds: Int?
    let pop: Double?
    let rain: Double?
    let uvi: Double?
    let snow: Double?

    enum CodingKeys: String, CodingKey {
        case dt = "dt"
        case sunrise = "sunrise"
        case sunset = "sunset"
        case moonrise = "moonrise"
        case moonset = "moonset"
        case moonPhase = "moon_phase"
        case temp = "temp"
        case feelsLike = "feels_like"
        case pressure = "pressure"
        case humidity = "humidity"
        case dewPoint = "dew_point"
        case windSpeed = "wind_speed"
        case windDeg = "wind_deg"
        case windGust = "wind_gust"
        case weather = "weather"
        case clouds = "clouds"
        case pop = "pop"
        case rain = "rain"
        case uvi = "uvi"
        case snow = "snow"
    }
}

// MARK: - FeelsLike
struct FeelsLike: Decodable {
    let day: Double?
    let night: Double?
    let eve: Double?
    let morn: Double?

    enum CodingKeys: String, CodingKey {
        case day = "day"
        case night = "night"
        case eve = "eve"
        case morn = "morn"
    }
}

// MARK: - Temp
struct Temp: Decodable {
    let day: Double?
    let min: Double?
    let max: Double?
    let night: Double?
    let eve: Double?
    let morn: Double?

    enum CodingKeys: String, CodingKey {
        case day = "day"
        case min = "min"
        case max = "max"
        case night = "night"
        case eve = "eve"
        case morn = "morn"
    }
}

// MARK: - Minutely
struct Minutely: Decodable {
    let dt: Int?
    let precipitation: Double?

    enum CodingKeys: String, CodingKey {
        case dt = "dt"
        case precipitation = "precipitation"
    }
}
