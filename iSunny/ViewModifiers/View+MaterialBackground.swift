//
//  View+MaterialBackground.swift
//  iSunny
//
//  Created by Arnaud NOMMAY on 14/03/2023.
//

import Foundation
import SwiftUI

/// ViewModifier for Weather Cards
struct MaterialBackground: ViewModifier {
    let cornerRadius: CGFloat
    
    func body(content: Content) -> some View {
        content
            .aspectRatio(1.0, contentMode: .fit)
            .background(
                .regularMaterial,
                in: RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
            )
    }
}

extension View {
    func materialBackground(cornerRadius: CGFloat = 8) -> some View {
        self.modifier(MaterialBackground(cornerRadius: cornerRadius))
    }
}
