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
                    CardView(card: card, isSelected: selectedCard == card)
                        .onTapGesture {
                            withAnimation {
                                selectedCard = card
                            }
                        }
                }
            }
            .padding(.horizontal)
        }
    }
}

struct CardView: View {
    var card: CardModel?
    var isSelected: Bool = false
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15)
                .fill(card?.color ?? Color.gray)
                .frame(width: isSelected ? 270 : 230, height: isSelected ? 160 : 140)
                .shadow(radius: 5)
                .opacity(isSelected ? 1.0 : 0.6) // Fade effect when not selected
            
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
    CardView(card: CardModel(cardName: "Visa", lastFour: "1234", cardColor: "#2345db"))
    CardView(card: CardModel(cardName: "Mastercard", lastFour: "5678", cardColor: "#3498db"))
}
