import SwiftUI

struct TransactionView: View {
    @State private var selectedCard: CardModel? = nil
    @State private var transactions: [Transaction] = [
        Transaction(id: 1, name: "Starbucks", amount: 5.99, category: nil, cardLastFour: "1234"),
        Transaction(id: 2, name: "Uber", amount: 12.49, category: nil, cardLastFour: "5678"),
        Transaction(id: 3, name: "Grocery", amount: 45.89, category: nil, cardLastFour: "1234"),
        Transaction(id: 4, name: "Netflix", amount: 15.99, category: "Entertainment", cardLastFour: "5678"),
        Transaction(id: 5, name: "Amazon Purchase", amount: 89.99, category: "Shopping", cardLastFour: "1234"),
        Transaction(id: 6, name: "McDonald's", amount: 8.49, category: "Food", cardLastFour: "5678"),
        Transaction(id: 7, name: "Spotify", amount: 9.99, category: "Entertainment", cardLastFour: "1234"),
        Transaction(id: 8, name: "Lyft", amount: 18.75, category: "Transport", cardLastFour: "5678"),
        Transaction(id: 9, name: "Target", amount: 62.30, category: "Shopping", cardLastFour: "1234"),
        Transaction(id: 10, name: "Chipotle", amount: 12.85, category: "Food", cardLastFour: "5678"),
        Transaction(id: 11, name: "Apple Store", amount: 299.99, category: "Electronics", cardLastFour: "1234"),
        Transaction(id: 12, name: "Best Buy", amount: 149.99, category: "Electronics", cardLastFour: "5678"),
        Transaction(id: 13, name: "Gym Membership", amount: 29.99, category: "Health", cardLastFour: "1234"),
        Transaction(id: 14, name: "CVS Pharmacy", amount: 22.45, category: "Health", cardLastFour: "5678")
        
    ]
    
    @State private var cards: [CardModel] = [
        CardModel(cardName: "Chase Sapphire", lastFour: "1234", cardColor: "#3498db"),
        CardModel(cardName: "Amex Platinum", lastFour: "5678", cardColor: "#7a546b")
    ]
    
    var filteredTransactions: [Transaction] {
        if let selectedCard = selectedCard {
            return transactions.filter { $0.cardLastFour == selectedCard.lastFour }
        }
        return transactions
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Your Cards")
                .font(.system(size: 35))
                .fontWeight(.bold)
                .padding(.leading, 16)
                .padding(.top, 10)
            
            RolodexView(selectedCard: $selectedCard, cards: cards)
            
            Text("Transactions")
                .font(.system(size: 35))
                .fontWeight(.bold)
                .padding(.leading, 16)
                .padding(.top, 10)
            ScrollView{
                ForEach(filteredTransactions) { transaction in
                    TransactionCard(transaction: transaction, cardLastFour: transaction.cardLastFour)
                }
            }
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        .onAppear {
            if cards.count == 1 {
                selectedCard = cards.first
            }
        }
    }
}

#Preview {
    TransactionView()
}
