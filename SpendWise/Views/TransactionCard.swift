//
//  TransactionCard.swift
//  SpendWise
//
//  Created by Sohil Shah on 2/10/25.
//

import SwiftUI

struct TransactionCard: View {
    let transaction: Transaction
    let cardLastFour: String

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(transaction.name)
                    .font(.headline)
                    .lineLimit(2)
                    .truncationMode(.tail)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Text("•••• \(cardLastFour)")
                    .font(.subheadline)
                    .fontWeight(.bold)
                    .foregroundColor(.gray)
            }
            
            Spacer()
            
            Text("$\(transaction.amount, specifier: "%.2f")")
                .font(.system(size: 25, weight: .bold))
                .foregroundColor(.black)
        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(10)
        .padding(.horizontal)
    }
}

#Preview {
    TransactionCard(transaction: .init(id: 1, name: "fjdljaljdljfldjaljdljlfjaljdljlafjldjlfjadjfljdljfl;ajdldddddddddddssssss", amount: 100, cardLastFour: "1245"), cardLastFour: "1234")
    TransactionCard(transaction: .init(id: 2, name: "Test", amount: 100, cardLastFour: "1245"), cardLastFour: "1234")
}

