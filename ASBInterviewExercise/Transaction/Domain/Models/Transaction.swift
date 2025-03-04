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
    let gst: Double

    init(from entity: TransactionEntity) {
        self.id = entity.id
        let dateFormatter = ISO8601DateFormatter()
        self.transactionDate = dateFormatter.date(from: entity.transactionDate) ?? Date()
        self.summary = entity.summary
        self.debit = entity.debit
        self.credit = entity.credit
        self.gst = Transaction.calculateGST(debit: entity.debit, credit: entity.credit)
    }
    
    //format date
    func getFormattedDate() -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .none
        return formatter.string(from: transactionDate)
    }
    
    //Static method to calculate the GST
    static func calculateGST(debit: Double, credit: Double) -> Double {
        return (debit + credit) * 0.15
    }
}
