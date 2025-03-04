//
//  TransactionRow.swift
//  ASBInterviewExercise
//
//  Created by Ray Liu on 04/03/2025.
//

import SwiftUI

struct TransactionRow: View {
    let transaction: Transaction
    
    var body: some View {
        HStack {
            Text(transaction.getFormattedDate())
            Spacer()
            Text(transaction.summary)
            Spacer()
            Text(transaction.debit > 0 ? "-\(transaction.debit, specifier: "%.2f")" : "+\(transaction.credit, specifier: "%.2f")")
        }
    }
}
