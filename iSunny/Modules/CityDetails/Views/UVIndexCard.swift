//
//  UVIndexCard.swift
//  iSunny
//
//  Created by Arnaud NOMMAY on 09/03/2023.
//

import SwiftUI

struct UVIndexCard: View {
    private let gradient = Gradient(colors: [.green, .yellow, .red, .purple])
    let uvi: Double

    var body: some View {
        VStack(alignment: .leading) {
            Label("UV Index", systemImage: "sun.max.fill").font(.headline)
            Text(uvi, format: .number).font(.title).bold()
            Gauge(value: uvi, in: 0.0...15.0) {
                Label("UV Index", systemImage: "sun.max.fill")
            }
            .gaugeStyle(.accessoryLinear)
            .tint(gradient)
            Text("Current UV index is \(uvi < 5 ? "low" : "high")")
        } .padding()
            .background(
                .regularMaterial,
                in: RoundedRectangle(cornerRadius: 8, style: .continuous)
            )
    }
}

struct UVIndexCard_Previews: PreviewProvider {
    static var previews: some View {
        UVIndexCard(uvi: 4.2)
    }
}
