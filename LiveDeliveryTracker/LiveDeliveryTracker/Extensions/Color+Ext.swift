//
//  Color+Ext.swift
//  LiveDeliveryWidgetExtension
//
//  Created by TanjilaNur-00115 on 1/11/23.
//

import SwiftUI

/// Extend the 'Color' to create colors from hex strings.
extension Color {
    init(hex: String) {
        
        /// Remove any non-alphanumeric characters from the input hex string.
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        
        /// Use a Scanner to parse the hex string into an integer.
        Scanner(string: hex).scanHexInt64(&int)
        
        let a, r, g, b: UInt64
        
        switch hex.count {
        case 3: /// 12-bit
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: /// 24-bit
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: /// 32-bit
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            /// If not in a recognized format, use a default color (fully opaque white).
            (a, r, g, b) = (255, 255, 255, 255)
        }
        
        /// Initialize the 'Color' object with the converted red, green, blue, and alpha components.
        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue: Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}

