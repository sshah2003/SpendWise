//
//  RoledexView.swift
//  SpendWise
//
//  Created by Sohil Shah on 2/13/25.
//

import SwiftUI

struct RolodexView: View {
    @Binding var selectedCard: CardModel?
    var cards: [CardModel]

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 15) {
                if cards.count > 1 {
                    CardView(card: nil)
                        .onTapGesture {
                            withAnimation { selectedCard = nil }
                        }
                }
                
                ForEach(cards) { card in
                    CardView(card: card)
                        .onTapGesture {
                            withAnimation { selectedCard = card }
                        }
                }
            }
            .padding(.horizontal)
        }
    }
}

struct CardView: View {
    var card: CardModel?

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15)
                .fill(card?.color ?? Color.gray) // Use converted color
                .frame(width: 250, height: 150)
                .shadow(radius: 5)

            VStack {
                if let card = card {
                    Text(card.cardName)
                        .font(.title2)
                        .foregroundColor(.white)
                    Text("•••• \(card.lastFour)")
                        .font(.headline)
                        .foregroundColor(.white.opacity(0.8))
                } else {
                    Text("All Cards")
                        .font(.title2)
                        .foregroundColor(.white)
                }
            }
        }
    }
}
#Preview {
    CardView(card: nil)
}
