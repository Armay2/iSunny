//
//  CityDetailView.swift
//  iSunny
//
//  Created by Arnaud NOMMAY on 08/03/2023.
//

import SwiftUI
import CoreLocation



struct CityDetailsView: View {
    @Environment(\.networkManager) var networkManager
    let city: City
    @State private var weather: Weather?
    let items = ["Item 1", "Item 2", "Item 3", "Item 4", "Item 5", "Item 6"]
    
    
    var body: some View {
        ScrollView {
            VStack {
                Text(String(format: "%.0f °C", weather?.current?.temp?.rounded(.toNearestOrAwayFromZero) ?? 42.42))
                    .font(.largeTitle)
                    .bold()
                    .redacted(reason: weather?.current?.temp == nil ? .placeholder : [])
                Text("\(weather?.current?.weather?[0].weatherDescription?.capitalized ?? "broken clouds")")
                    .redacted(reason: weather?.current?.weather?[0].weatherDescription == nil ? .placeholder : [])
                HStack {
                    Text(String(format: "H:%.0f °C", weather?.daily?[0].temp?.max?.rounded(.toNearestOrAwayFromZero) ?? 42.42))
                    Divider()
                    Text(String(format: "L:%.0f °C", weather?.daily?[0].temp?.min?.rounded(.toNearestOrAwayFromZero) ?? 42.42))
                }
                
                AlertsStack(alerts: weather?.alerts ?? [])

                HourlyCard(hourlyForcast: weather?.hourly ?? [Current.default])
                    .redacted(reason: weather?.hourly == nil ? .placeholder : [])
                
                LazyVGrid(columns: [GridItem(.flexible(), spacing: 10), GridItem(.flexible(), spacing: 10)], spacing: 10) {
                    PressureCard(pressure: Double(weather?.current?.pressure ?? 1))
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .aspectRatio(1.0, contentMode: .fit)
                        .redacted(reason: weather?.current?.pressure == nil ? .placeholder : [])
                    
                    BasicWeatherCard(title: "Feel Like", value: String(format: "%.0f °C", weather?.current?.feelsLike?.rounded(.toNearestOrAwayFromZero) ?? 42.42), icon: "thermometer.medium", label: "Equal to human perception of weather")
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .aspectRatio(1.0, contentMode: .fit)
                        .background(
                            .regularMaterial,
                            in: RoundedRectangle(cornerRadius: 8, style: .continuous)
                        )
                        .redacted(reason: weather?.current?.feelsLike == nil ? .placeholder : [])
                    
                    BasicWeatherCard(title: "Humidity", value: "\(weather?.current?.humidity ?? 0) %", icon: "humidity", label: "And the dew point is \(weather?.current?.dewPoint ?? 0) right now")
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .aspectRatio(1.0, contentMode: .fit)
                        .background(
                            .regularMaterial,
                            in: RoundedRectangle(cornerRadius: 8, style: .continuous)
                        )
                        .redacted(reason: weather?.current?.humidity == nil ? .placeholder : [])
                }
                
                Link("Weather data from OpenWeather API", destination: URL(string: "https://openweathermap.org/api/one-call-3#data")!).foregroundColor(.teal)
            }.padding()
        }.background(.blue)
            .task {
                do {
                    guard let lat = city.latidude, let long = city.longitude else {
                        print("No city coordonate")
                        return
                    }

                    weather = try await networkManager.fetch(.weather(latitude: lat, longitude: long))
                } catch let error {
                    print("error handling here: \(error.localizedDescription)")
                    print(String(describing: error))
                }
            }
            .navigationTitle(city.name)
        
    }
}

struct CityDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            CityDetailsView(city: City.exemple3)
        }
    }
}
