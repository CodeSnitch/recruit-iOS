//
//  TransactionDetailViewViewModel.swift
//  ASBInterviewExercise
//
//  Created by Ray Liu on 04/03/2025.
//

import SwiftUI

class TransactionDetailViewViewModel: ObservableObject {
    @Published var transaction: Transaction
    
    init(transaction: Transaction) {
        self.transaction = transaction
    }
}
