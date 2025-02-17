//
//  CardModel.swift
//  SpendWise
//
//  Created by Sohil Shah on 2/13/25.
//


import SwiftUI

struct CardModel: Identifiable, Codable {
    var id = UUID()
    let cardName: String
    let lastFour: String
    let cardColor: String // Stored as a hex string
    
    var color: Color {
        Color(hex: cardColor) ?? .gray // Convert to SwiftUI Color
    }
}

// Extension to convert Hex string to Color
extension Color {
    init?(hex: String) {
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")

        var rgb: UInt64 = 0
        Scanner(string: hexSanitized).scanHexInt64(&rgb)

        let red = Double((rgb >> 16) & 0xFF) / 255.0
        let green = Double((rgb >> 8) & 0xFF) / 255.0
        let blue = Double(rgb & 0xFF) / 255.0

        self.init(.sRGB, red: red, green: green, blue: blue, opacity: 1)
    }
}
