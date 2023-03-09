//
//  PressureCard.swift
//  iSunny
//
//  Created by Arnaud NOMMAY on 09/03/2023.
//

import SwiftUI

struct PressureCard: View {
    let pressure: Double
    private let minValue = 870.0
    private let maxValue = 1085.7
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 8, style: .continuous)
                .fill(.regularMaterial)
            VStack(alignment: .leading) {
                Label("Pressure", systemImage: "gauge.medium").font(.headline)
                Spacer()
                HStack {
                    Spacer()
                    Gauge(value: Double(pressure), in: minValue...maxValue) {
                        Text("hPa")
                    } currentValueLabel: {
                        Text(pressure, format: .number)
                    }.gaugeStyle(.accessoryCircular)
                    Spacer()
                }
                Spacer()
                Text("Atmospheric pressure in hPa")
            }
            .padding()
        }
    }
}

struct PressureCard_Previews: PreviewProvider {
    static var previews: some View {
        PressureCard(pressure: 900.0)
    }
}
