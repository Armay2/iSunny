//
//  BasicWeatherCard.swift
//  iSunny
//
//  Created by Arnaud NOMMAY on 09/03/2023.
//

import SwiftUI

struct BasicWeatherCard: View {
    let title: String
    let value: String
    let icon: String
    let label: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Label(title, systemImage: "thermometer.medium").font(.headline)
            Text(value).font(.title).bold()
            Spacer()
            Text(label)
        }
        .padding()
    }
}

struct BasicWeatherCard_Previews: PreviewProvider {
    static var previews: some View {
        BasicWeatherCard(title: "Feel like", value: "12 C", icon: "thermometer.medium", label: "similar to the actual temperature")
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .aspectRatio(1.0, contentMode: .fit)
    }
}
