//
//  TransactionListViewModel.swift
//  ASBInterviewExercise
//
//  Created by Ray Liu on 04/03/2025.
//
import Combine
import SwiftUI

class TransactionListViewModel: ObservableObject {
    @Published var transactions: [Transaction] = []
    
    private let fetchTransactionsUseCase: FetchTransactionUseCaseProtocol
    private var cancellables = Set<AnyCancellable>()
    
    init(fetchTransactionsUseCase: FetchTransactionUseCaseProtocol) {
        self.fetchTransactionsUseCase = fetchTransactionsUseCase
    }
    
    func fetchTransactions() {
            fetchTransactionsUseCase.execute()
                .receive(on: DispatchQueue.main)
                .sink(receiveCompletion: { completion in
                    switch completion {
                    case .finished:
                        break
                    case .failure(let error):
                        print("Error fetching transactions: \(error)")
                    }
                }, receiveValue: { [weak self] transactions in
                    self?.transactions = transactions
                })
                .store(in: &cancellables)
        }
}
