//
//  TabModel.swift
//  SpendWise
//
//  Created by Sohil Shah on 2/11/25.
//

import SwiftUI

enum TabModel: String, CaseIterable {
    case transactions = "list.bullet"
    case dashboard = "chart.pie.fill"
    case profile = "person.crop.circle"
    
    var title: String {
        switch self {
        case .transactions: return "Transactions"
        case .dashboard: return "Dashboard"
        case .profile: return "Profile"
        }
    }
}

