//
//  ContentView.swift
//  SpendWise
//
//  Created by Sohil Shah on 2/10/25.
//

import SwiftUI

struct ContentView: View {
    @State private var activeTab: TabModel = .transactions

    var body: some View {
        ZStack {
            VStack {
                // Display selected tab view
                switch activeTab {
                case .transactions:
                    TransactionView()
                case .dashboard:
                    DashboardView()
                case .profile:
                    ProfileView()
                }
                
                Spacer()

                // Custom Tab Bar at the bottom
                CustomTabBar(activeTab: $activeTab)
                    .padding(.bottom, 10)
            }
            .ignoresSafeArea(.keyboard, edges: .bottom)
        }
    }
}


#Preview {
    ContentView()
}
