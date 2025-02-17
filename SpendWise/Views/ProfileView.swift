//
//  ProfileView.swift
//  SpendWise
//
//  Created by Sohil Shah on 2/10/25.
//

import SwiftUI

struct ProfileView: View {
    @State private var budget: Double = 500.0

    var body: some View {
        VStack {
            Image(systemName: "person.circle.fill")
                .resizable()
                .frame(width: 100, height: 100)
                .padding()
            
            Text("John Doe")
                .font(.title)
            
            Text("Monthly Budget: $\(budget, specifier: "%.2f")")
                .foregroundColor(.gray)
                .padding()
            
            Slider(value: $budget, in: 100...2000, step: 50)
                .padding()
            
            Spacer()
        }
    }
}


#Preview {
    ProfileView()
}
