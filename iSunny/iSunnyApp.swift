//
//  iSunnyApp.swift
//  iSunny
//
//  Created by Arnaud NOMMAY on 07/03/2023.
//

import SwiftUI

@main
struct iSunnyApp: App {
    @State var networkManager = NetworkManager(environment: .production)
    
    var body: some Scene {
        WindowGroup {
            CitiesView()
                .environment(\.networkManager, networkManager)
        }
    }
}
