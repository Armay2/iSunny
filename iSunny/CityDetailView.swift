//
//  CityDetailView.swift
//  iSunny
//
//  Created by Arnaud NOMMAY on 08/03/2023.
//

import SwiftUI
import CoreLocation

struct AlertCard: View {
    let alert: Alert
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Label(alert.event ?? "no event", systemImage: "exclamationmark.triangle.fill")
                .font(.headline)
            Text(alert.description ?? "no desc")
        }
        .padding()
        .background(
            .regularMaterial,
            in: RoundedRectangle(cornerRadius: 8, style: .continuous)
        )
    }
}

struct CityDetailView: View {
    @Environment(\.networkManager) var networkManager
    let city: City
    @State private var weather = Weather.default
    
    
    var body: some View {
        ScrollView {
            VStack {
                //                Text("\(city.location?.coordinate.latitude ?? 1.1)")
                //                    .font(.headline)
                //                    .redacted(reason: city.location?.coordinate == nil ? .placeholder : [])
                Text(String(format: "%.0f °C", weather.current?.temp?.rounded(.toNearestOrAwayFromZero) ?? 42.42))
                    .font(.largeTitle)
                    .bold()
                    .redacted(reason: weather.current?.temp == nil ? .placeholder : [])
                Text("\(weather.current?.weather?[0].weatherDescription?.capitalized ?? "broken clouds")")
                    .redacted(reason: weather.current?.weather?[0].weatherDescription == nil ? .placeholder : [])
                HStack {
                    Text(String(format: "H:%.0f °C", weather.daily?[0].temp?.max?.rounded(.toNearestOrAwayFromZero) ?? 42.42))
                    Divider()
                    Text(String(format: "L:%.0f °C", weather.daily?[0].temp?.min?.rounded(.toNearestOrAwayFromZero) ?? 42.42))
                }
                
                ForEach(weather.alerts ?? [], id: \.self) { alert in
                    AlertCard(alert: alert).padding(.top)
                }
                

            }.padding()
        }
        .task {
            do {
                guard let lat = city.location?.coordinate.latitude, let long = city.location?.coordinate.longitude else {
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
            CityDetailView(city: City.exemple3)
        }
    }
}
