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
                ForEach(viewModel.transactions) { transaction in
                    Button(action: {
                        selectedTransaction = transaction
                    }) {
                        TransactionRow(transaction: transaction)
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
