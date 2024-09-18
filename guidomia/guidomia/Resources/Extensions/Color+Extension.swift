//
//  Color+Extension.swift
//  Guidomia
//
//  Created by Jade Lapuz on 9/18/24.
//

import Foundation
import SwiftUI

extension Color {
    init(hex: String, opacity: Double = 1.0) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let r, g, b: UInt64
        let a: Double = opacity // Use the provided opacity (alpha) value

        switch hex.count {
        case 3: // RGB (12-bit)
            (r, g, b) = ((int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (r, g, b) = (int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            // If the hex string provides alpha value, we ignore the provided opacity parameter.
            let alpha = Double(int >> 24) / 255
            (r, g, b) = (int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
            self.init(
                .sRGB,
                red: Double(r) / 255,
                green: Double(g) / 255,
                blue: Double(b) / 255,
                opacity: alpha
            )
            return
        default:
            (r, g, b) = (0, 0, 0) // Default to black in case of invalid input
        }

        // Use provided opacity for RGB cases
        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue: Double(b) / 255,
            opacity: a
        )
    }
}

