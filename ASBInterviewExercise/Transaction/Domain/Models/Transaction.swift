//
//  Transaction.swift
//  ASBInterviewExercise
//
//  Created by Ray Liu on 04/03/2025.
//

import Foundation

struct Transaction: Identifiable {
    let id: Int
    let transactionDate: Date
    let summary: String
    let debit: Double
    let credit: Double
    
    init(from entity: TransactionEntity) {
        self.id = entity.id
        let dateFormatter = ISO8601DateFormatter()
        self.transactionDate = dateFormatter.date(from: entity.transactionDate) ?? Date()
        self.summary = entity.summary
        self.debit = entity.debit
        self.credit = entity.credit
    }
}
