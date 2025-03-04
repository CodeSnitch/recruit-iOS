//
//  TransactionListView.swift
//  ASBInterviewExercise
//
//  Created by Ray Liu on 04/03/2025.
//
import SwiftUI
import Combine

struct TransactionListView: View {
    @ObservedObject var viewModel: TransactionListViewModel
    @State private var selectedTransaction: Transaction?
    var body: some View {
        NavigationView {
            List {
                if viewModel.isLoading {
                    ProgressView()
                        .accessibility(label: Text("Loading transactions"))
                } else if let errorMessage = viewModel.errorMessage {
                    Text("Error: \(errorMessage)")
                        .foregroundColor(.red)
                        .accessibility(label: Text("Error: \(errorMessage)"))
                } else {
                    ForEach(viewModel.transactions) { transaction in
                        Button(action: {
                            selectedTransaction = transaction
                        }) {
                            TransactionRow(transaction: transaction)
                        }
                        .accessibility(hint: Text("Tap to view details"))
                    }
                }
            }
        }
        .navigationTitle("Transactions")
        .onAppear{
            viewModel.fetchTransactions()
        }
        .sheet(item: $selectedTransaction) { transaction in
            TransactionDetailView(viewModel: TransactionDetailViewViewModel(transaction: transaction))
        }
    }
}
