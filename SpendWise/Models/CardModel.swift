//
//  CardModel.swift
//  SpendWise
//
//  Created by Sohil Shah on 2/13/25.
//


import SwiftUI

import SwiftUI

struct CardModel: Identifiable, Equatable {
    var id = UUID()
    var cardName: String
    var lastFour: String
    var cardColor: String // Store hex code

    // Computed property to convert hex string to SwiftUI Color
    var color: Color {
        Color(hex: cardColor) ?? Color.gray
    }

    static func == (lhs: CardModel, rhs: CardModel) -> Bool {
        return lhs.cardName == rhs.cardName && lhs.lastFour == rhs.lastFour && lhs.cardColor == rhs.cardColor
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
