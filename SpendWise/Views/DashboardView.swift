//
//  DashboardView.swift
//  SpendWise
//
//  Created by Sohil Shah on 2/10/25.
//

import SwiftUI
import Charts

struct DashboardView: View {
    @State private var selectedMonth: String? = nil
    @State private var spendingData: [MonthlySpending] = [
        MonthlySpending(month: "January", totalSpent: 500, budget: 800, categoryBreakdown: [
            CategorySpending(category: "Food", amount: 200, color: .red),
            CategorySpending(category: "Transport", amount: 100, color: .blue),
            CategorySpending(category: "Shopping", amount: 150, color: .green)
        ]),
        MonthlySpending(month: "February", totalSpent: 700, budget: 900, categoryBreakdown: [
            CategorySpending(category: "Food", amount: 250, color: .red),
            CategorySpending(category: "Transport", amount: 150, color: .blue),
            CategorySpending(category: "Shopping", amount: 300, color: .green)
        ])
    ]
    
    var body: some View {
        ZStack {
            ScrollView {
                VStack(spacing: 16) {
                    // Main Spending vs. Budget Graph
                    ZStack {
                        RoundedRectangle(cornerRadius: 15)
                            .fill(Color.black.opacity(0.2))
                            .frame(height: 300)
                        
                        Chart(spendingData) { data in
                            BarMark(x: .value("Month", data.month),
                                    y: .value("Spent", data.totalSpent))
                                .foregroundStyle(Color.red)
                            
                            LineMark(x: .value("Month", data.month),
                                     y: .value("Budget", data.budget))
                                .foregroundStyle(Color.blue)
                        }
                        .frame(height: 250)
                        .padding()
                    }
                    .gesture(LongPressGesture().onEnded { _ in
                        withAnimation {
                            selectedMonth = spendingData.first?.month
                        }
                    })
                    
                    if let month = selectedMonth, let breakdown = spendingData.first(where: { $0.month == month })?.categoryBreakdown {
                        VStack {
                            Text("Spending Breakdown for \(month)")
                                .font(.headline)
                            ForEach(breakdown.filter { $0.amount > 0 }) { category in
                                HStack {
                                    Circle()
                                        .fill(category.color)
                                        .frame(width: 15, height: 15)
                                    Text("\(category.category): $\(category.amount, specifier: "%.2f")")
                                        .foregroundColor(.white)
                                }
                            }
                        }
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color.black.opacity(0.2)))
                    }
                    
                    // Individual Category Analytics
                    ForEach(spendingData.first?.categoryBreakdown ?? []) { category in
                        ZStack {
                            RoundedRectangle(cornerRadius: 15)
                                .fill(Color.black.opacity(0.2))
                                .frame(height: 150)
                            
                            VStack {
                                Text("\(category.category) Spending")
                                    .font(.headline)
                                Text("$\(category.amount, specifier: "%.2f")")
                                    .font(.title2)
                                    .foregroundColor(category.color)
                            }
                        }
                    }
                }
                .padding()
            }
        }
    }
}

struct MonthlySpending: Identifiable {
    let id = UUID()
    let month: String
    let totalSpent: Double
    let budget: Double
    let categoryBreakdown: [CategorySpending]
}

struct CategorySpending: Identifiable {
    let id = UUID()
    let category: String
    let amount: Double
    let color: Color
}


#Preview {
    DashboardView()
}
