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
                .accessibility(label: Text("Date:, \(transaction.getFormattedDate())"))

            Spacer()
            Text(transaction.summary)
                .accessibility(label: Text("Summary, \(transaction.summary)"))

            Spacer()
            Text(transaction.debit > 0 ? "-\(transaction.debit, specifier: "%.2f")" : "+\(transaction.credit, specifier: "%.2f")")
                .accessibility(label: Text(transaction.debit > 0 ? "Debit: \(transaction.debit, specifier: "%.2f")" : "Credit: \(transaction.credit, specifier: "%.2f")"))
                .foregroundColor(transaction.debit > 0 ? .red : .green) // Apply color to the entire row

        }
    }
}
