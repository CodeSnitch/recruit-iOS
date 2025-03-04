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
                .accessibility(identifier: "detailSummary")
                .accessibility(label: Text("Summary, \(viewModel.transaction.summary)"))
            Text("Date: \(viewModel.transaction.getFormattedDate())")
                .accessibility(label: Text("Date, \(viewModel.transaction.getFormattedDate())"))
            Text("Debit: \(viewModel.transaction.debit, specifier: "%.2f")")
                .foregroundColor(.red)
                .accessibility(label: Text("Debit, \(viewModel.transaction.debit, specifier: "%.2f")"))
            Text("Credit: \(viewModel.transaction.credit, specifier: "%.2f")")
                .foregroundColor(.green)
                .accessibility(label: Text("Credit, \(viewModel.transaction.credit, specifier: "%.2f")"))
            Text("GST (15%): \(viewModel.transaction.gst, specifier: "%.2f")")
              .accessibility(label: Text("GST 15 percent, \(viewModel.transaction.gst, specifier: "%.2f")"))//Talkback
            Spacer()
        }
        .padding()
        .navigationTitle("Transaction Detail")
    }
}
