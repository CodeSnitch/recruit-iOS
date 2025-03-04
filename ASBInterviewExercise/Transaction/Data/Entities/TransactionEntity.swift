//
//  Untitled.swift
//  ASBInterviewExercise
//
//  Created by Ray Liu on 04/03/2025.
//

struct TransactionEntity: Decodable, Identifiable {
    let id: Int
    let transactionDate: String
    let summary: String
    let debit: Double
    let credit: Double
}
