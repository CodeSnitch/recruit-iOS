//
//  TransactionDetailView.swift
//  ASBInterviewExercise
//
//  Created by Ray Liu on 04/03/2025.
//

import SwiftUI

struct TransactionDetailView: View {
    @ObservedObject var viewModel: TransactionDetailViewViewModel

    var body: some View {
        VStack(alignment: .leading) {
            Text("Summary: \(viewModel.transaction.summary)")
                .font(.title)
            Text("Date: \(viewModel.transaction.transactionDate))")
            Text("Debit: \(viewModel.transaction.debit, specifier: "%.2f")")
            Text("Credit: \(viewModel.transaction.credit, specifier: "%.2f")")
            Spacer()
        }
        .padding()
        .navigationTitle("Transaction Detail")
    }
}
