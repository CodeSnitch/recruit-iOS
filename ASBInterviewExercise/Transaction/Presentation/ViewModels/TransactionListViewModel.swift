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
    @Published var isLoading: Bool = false
    @Published var errorMessage: String? = nil
    
    private let fetchTransactionsUseCase: FetchTransactionUseCaseProtocol
    private var cancellables = Set<AnyCancellable>()
    
    init(fetchTransactionsUseCase: FetchTransactionUseCaseProtocol) {
        self.fetchTransactionsUseCase = fetchTransactionsUseCase
    }
    
    func fetchTransactions() {
        isLoading = true
        errorMessage = nil
        fetchTransactionsUseCase.execute()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [weak self] completion in
                self?.isLoading = false
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    self?.errorMessage = error.localizedDescription
                    print("Error fetching transactions: \(error)")
                }
            }, receiveValue: { [weak self] transactions in
                self?.transactions = transactions
            })
            .store(in: &cancellables)
    }
}
