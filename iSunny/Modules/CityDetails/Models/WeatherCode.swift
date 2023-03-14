////
////  WeatherCode.swift
////  iSunny
////
////  Created by Arnaud NOMMAY on 09/03/2023.
////
//
//import Foundation
//import SwiftUI

// MARK: Not used but good idea for the futur

//enum WeatherCode: Int, Codable {
//    case thunderstormWithLightRain = 200
//    case thunderstormWithRain = 201
//    case thunderstormWithHeavyRain = 202
//    case lightThunderstorm = 210
//    case thunderstorm = 211
//    case heavyThunderstorm = 212
//    case raggedThunderstorm = 221
//    case thunderstormWithLightDrizzle = 230
//    case thunderstormWithDrizzle = 231
//    case thunderstormWithHeavyDrizzle = 232
//    case lightIntensityDrizzle = 300
//    case drizzle = 301
//    case heavyIntensityDrizzle = 302
//    case lightIntensityDrizzleRain = 310
//    case drizzleRain = 311
//    case heavyIntensityDrizzleRain = 312
//    case showerRainAndDrizzle = 313
//    case heavyShowerRainAndDrizzle = 314
//    case showerDrizzle = 321
//    case lightRain = 500
//    case moderateRain = 501
//    case heavyIntensityRain = 502
//    case veryHeavyRain = 503
//    case extremeRain = 504
//    case freezingRain = 511
//    case lightIntensityShowerRain = 520
//    case showerRain = 521
//    case heavyIntensityShowerRain = 522
//    case raggedShowerRain = 531
//    case lightSnow = 600
//    case snow = 601
//    case heavySnow = 602
//    case sleet = 611
//    case lightShowerSleet = 612
//    case showerSleet = 613
//    case lightRainAndSnow = 615
//    case rainAndSnow = 616
//    case lightShowerSnow = 620
//    case showerSnow = 621
//    case heavyShowerSnow = 622
//    case mist = 701
//    case smoke = 711
//    case haze = 721
//    case sandAndDustWhirls = 731
//    case fog = 741
//    case sand = 751
//    case dust = 761
//    case volcanicAsh = 762
//    case squalls = 771
//    case tornado = 781
//    case clearSky = 800
//    case fewClouds = 801
//    case scatteredClouds = 802
//    case brokenClouds = 803
//    case overcastClouds = 804
//    
//    var image: Image {
//        switch self {
//        case .thunderstormWithLightRain:
//            return Image(systemName: "cloud.bolt")
//        case .thunderstormWithRain:
//            return Image(systemName: "cloud.bolt")
//        case .thunderstormWithHeavyRain:
//            return Image(systemName: "cloud.bolt")
//        case .lightThunderstorm:
//            return Image(systemName: "cloud.bolt")
//        case .thunderstorm:
//            return Image(systemName: "cloud.bolt")
//        case .heavyThunderstorm:
//            return Image(systemName: "cloud.bolt")
//        case .raggedThunderstorm:
//            return Image(systemName: "cloud.bolt")
//        case .thunderstormWithLightDrizzle:
//            return Image(systemName: "cloud.bolt")
//        case .thunderstormWithDrizzle:
//            return Image(systemName: "cloud.bolt")
//        case .thunderstormWithHeavyDrizzle:
//            return Image(systemName: "cloud.bolt")
//        case .lightIntensityDrizzle:
//            return Image(systemName: "cloud.rain")
//        case .drizzle:
//            return Image(systemName: "cloud.rain")
//        case .heavyIntensityDrizzle:
//            return Image(systemName: "cloud.rain")
//        case .lightIntensityDrizzleRain:
//            return Image(systemName: "cloud.rain")
//        case .drizzleRain:
//            return Image(systemName: "cloud.rain")
//        case .heavyIntensityDrizzleRain:
//            return Image(systemName: "cloud.rain")
//        case .showerRainAndDrizzle:
//            return Image(systemName: "cloud.rain")
//        case .heavyShowerRainAndDrizzle:
//            return Image(systemName: "cloud.rain")
//        case .showerDrizzle:
//            return Image(systemName: "cloud.rain")
//        case .lightRain:
//            <#code#>
//        case .moderateRain:
//            <#code#>
//        case .heavyIntensityRain:
//            <#code#>
//        case .veryHeavyRain:
//            <#code#>
//        case .extremeRain:
//            <#code#>
//        case .freezingRain:
//            <#code#>
//        case .lightIntensityShowerRain:
//            <#code#>
//        case .showerRain:
//            <#code#>
//        case .heavyIntensityShowerRain:
//            <#code#>
//        case .raggedShowerRain:
//            <#code#>
//        case .lightSnow:
//            <#code#>
//        case .snow:
//            <#code#>
//        case .heavySnow:
//            <#code#>
//        case .sleet:
//            <#code#>
//        case .lightShowerSleet:
//            <#code#>
//        case .showerSleet:
//            <#code#>
//        case .lightRainAndSnow:
//            <#code#>
//        case .rainAndSnow:
//            <#code#>
//        case .lightShowerSnow:
//            <#code#>
//        case .showerSnow:
//            <#code#>
//        case .heavyShowerSnow:
//            <#code#>
//        case .mist:
//            <#code#>
//        case .smoke:
//            <#code#>
//        case .haze:
//            <#code#>
//        case .sandAndDustWhirls:
//            <#code#>
//        case .fog:
//            <#code#>
//        case .sand:
//            <#code#>
//        case .dust:
//            <#code#>
//        case .volcanicAsh:
//            <#code#>
//        case .squalls:
//            <#code#>
//        case .tornado:
//            <#code#>
//        case .clearSky:
//            <#code#>
//        case .fewClouds:
//            <#code#>
//        case .scatteredClouds:
//            <#code#>
//        case .brokenClouds:
//            <#code#>
//        case .overcastClouds:
//            <#code#>
//        }
//    }
//    
//}
