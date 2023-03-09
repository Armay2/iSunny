//
//  AlertCard.swift
//  iSunny
//
//  Created by Arnaud NOMMAY on 09/03/2023.
//

import SwiftUI

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

struct AlertCard_Previews: PreviewProvider {
    static var previews: some View {
        AlertCard(alert: Alert(senderName: "METEO-FRANCE", event: "Moderate wind warning", start: 1678316400, end: 1678402800, description: "Moderate damages may occur, especially in vulnerable or in exposed areas and to people who carry out weather-related activities.", tags: ["Wind"]))
    }
}
