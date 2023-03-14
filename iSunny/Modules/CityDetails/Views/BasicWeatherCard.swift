//
//  BasicWeatherCard.swift
//  iSunny
//
//  Created by Arnaud NOMMAY on 09/03/2023.
//

import SwiftUI

struct BasicWeatherCard: View {
    // MARK: Properties
    let title: String
    let value: String
    let icon: String
    let label: String
    
    // MARK: Constants
    private let cornerRadius: CGFloat = 8
    private let cardAspectRatio: CGFloat = 1.0
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Label(title, systemImage: icon).font(.headline)
                Text(value).font(.title).bold()
                Spacer()
                Text(label)
            }
            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .materialBackground()
    }
}

#if DEBUG
struct BasicWeatherCard_Previews: PreviewProvider {
    static var previews: some View {
        BasicWeatherCard(title: "Feel like", value: "12 C", icon: "thermometer.medium", label: "similar")
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .aspectRatio(1.0, contentMode: .fit)
    }
}
#endif
