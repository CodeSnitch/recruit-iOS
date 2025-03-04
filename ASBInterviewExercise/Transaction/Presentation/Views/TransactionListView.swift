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
    }
}

struct TransactionRow: View {
    let transaction: Transaction
    
    var body: some View {
        HStack {
            Text(transaction.summary)
            Spacer()
            Text(transaction.debit > 0 ? "-\(transaction.debit, specifier: "%.2f")" : "+\(transaction.credit, specifier: "%.2f")")
        }
    }
}

let transactionEntities: [TransactionEntity] = [
     TransactionEntity(id: 1, transactionDate: "2021-08-31T15:47:10", summary: "Hackett, Stamm and Kuhn", debit: 9379.55, credit: 0),
     TransactionEntity(id: 2, transactionDate: "2022-02-17T10:44:35", summary: "Hettinger, Wilkinson and Kshlerin", debit: 3461.35, credit: 0),
     TransactionEntity(id: 3, transactionDate: "2021-02-21T08:19:12", summary: "McKenzie, Bins and Macejkovic", debit: 0, credit: 1415.74),
     TransactionEntity(id: 4, transactionDate: "2021-12-15T14:35:20", summary: "Treutel, Schaden and Pfannerstill", debit: 1639.43, credit: 0)
 ]

let transactionsFromEntities: [Transaction] = transactionEntities.map { Transaction(from: $0) }

// Preview for TransactionRow
struct TransactionRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TransactionRow(transaction: transactionsFromEntities[0])
            TransactionRow(transaction: transactionsFromEntities[2])
        }
        .previewLayout(.sizeThatFits) // Important for list row previews
    }
}

// Preview for TransactionList
struct TransactionList_Preview: PreviewProvider {
    static var previews: some View {
//        TransactionListView(transactionList: transactionsFromEntities)
    }
}
