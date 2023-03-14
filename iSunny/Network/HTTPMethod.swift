//
//  HTTPMethod.swift
//  iSunny
//
//  Created by Arnaud NOMMAY on 09/03/2023.
//

import Foundation

/// HTTPMethods for API fetch
enum HTTPMethod: String {
    case delete, get, patch, post, put
    var rawValue: String {
        String (describing: self).uppercased()
    }
}
