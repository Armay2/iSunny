//
//  AlertsStack.swift
//  iSunny
//
//  Created by Arnaud NOMMAY on 09/03/2023.
//

import SwiftUI

struct AlertsStack: View {
    let alerts: [Alert]
    
    var body: some View {
        VStack {
            ForEach(alerts, id: \.self) { alert in
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
    }
}

struct AlertsStack_Previews: PreviewProvider {
    static var previews: some View {
        AlertsStack(alerts: [Alert.default])
    }
}
