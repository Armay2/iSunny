//
//  NetworkManagerKey.swift
//  iSunny
//
//  Created by Arnaud NOMMAY on 09/03/2023.
//

import Foundation
import SwiftUI

struct NetworkManagerKey: EnvironmentKey {
    static var defaultValue = NetworkManager(environment: .production)
}

extension EnvironmentValues {
    var networkManager: NetworkManager {
        get { self[NetworkManagerKey.self] }
        set { self[NetworkManagerKey.self] = newValue }
    }
}
