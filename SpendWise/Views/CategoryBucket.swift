//
//  CategoryBucket.swift
//  SpendWise
//
//  Created by Sohil Shah on 2/10/25.
//

import SwiftUI

struct CategoryBucket: View {
    let category: Category
    @Binding var transactions: [Transaction]

    var body: some View {
        VStack {
            Image(systemName: category.icon)
                .font(.largeTitle)
                .padding()
            
            Text(category.name)
                .font(.caption)
        }
        .frame(width: 80, height: 100)
        .background(Color.blue.opacity(0.2))
        .cornerRadius(10)
        .onDrop(of: [.json], isTargeted: nil) { providers in
            _ = providers.first?.loadTransferable(type: Transaction.self) { result in
                DispatchQueue.main.async {
                    switch result {
                    case .success(let transaction):  // No need for optional binding here
                        if let index = transactions.firstIndex(where: { $0.id == transaction.id }) {
                            transactions[index].category = category.name
                        }
                    case .failure(let error):
                        print("Failed to load transaction: \(error)")
                    }
                }
            }
            return true
        }

    }
}


