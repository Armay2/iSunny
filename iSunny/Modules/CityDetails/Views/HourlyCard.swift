//
//  HourlyCard.swift
//  iSunny
//
//  Created by Arnaud NOMMAY on 09/03/2023.
//

import SwiftUI

struct HourlyCard: View {
    let hourlyForcast: [Current]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Label("Hourly Forcast", systemImage: "clock").font(.headline)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 5) {
                    ForEach(hourlyForcast, id: \.self) { forcast in
                        VStack(alignment: .center, spacing: 10) {
                            Text(dataToCorrectDate(for: forcast.dt ?? 1)).font(.footnote)
                            AsyncImage(url: URL(string: "https://openweathermap.org/img/wn/\(forcast.weather?[0].icon ?? "")@2x.png")) { image in
                                image
                                    .resizable()
                                    .frame(width: 40, height: 40)
                            } placeholder: {
                                RoundedRectangle(cornerRadius: 9)
                                    .frame(width: 40, height: 40)
                                    .redacted(reason: .placeholder)
                            }
                            Text(String(format: "%.0f°", forcast.temp?.rounded(.toNearestOrAwayFromZero) ?? 42.42))
                        }
                    }
                }
            }
        }
        .padding()
        .background(
            .regularMaterial,
            in: RoundedRectangle(cornerRadius: 8, style: .continuous)
        )
    }
    
    private func dataToCorrectDate(for timestamp: Int) -> String {
        let date = Date(timeIntervalSince1970: TimeInterval(timestamp))
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "ha"
        let dateString = dateFormatter.string(from: date)
        return dateString
    }
}

struct HourlyCard_Previews: PreviewProvider {
    static var previews: some View {
        HourlyCard(hourlyForcast: [Weather.default.current!])
    }
}
