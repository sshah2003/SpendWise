//
//  Models.swift
//  SpendWise
//
//  Created by Sohil Shah on 2/10/25.
//

import Foundation
import UniformTypeIdentifiers
import CoreTransferable

struct Transaction: Identifiable, Codable {
    let id: Int
    let name: String
    let amount: Double
    var category: String? // Using String for simplicity
    let cardLastFour: String // Track which card was used for this transaction
}

extension Transaction: Transferable {
    static var transferRepresentation: some TransferRepresentation {
        CodableRepresentation(contentType: .json)
    }
}

struct Category: Identifiable, Codable {
    var id = UUID()
    let name: String
    let icon: String
}
