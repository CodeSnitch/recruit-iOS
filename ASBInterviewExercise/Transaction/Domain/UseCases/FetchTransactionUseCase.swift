//
//  Untitled.swift
//  ASBInterviewExercise
//
//  Created by Ray Liu on 04/03/2025.
//
import Combine

class FetchTransactionUseCase: FetchTransactionUseCaseProtocol {
    private let repository: TransactionRepositoryProtocol
    
    init(repository: TransactionRepositoryProtocol) {
        self.repository = repository
    }
    
    func execute() -> AnyPublisher<[Transaction], any Error> {
        return repository.fetchTransactions()
            .map { entities in
                entities.map{ Transaction(from: $0)} // Convert entity to domain model
            }
            .map { transactions in
                transactions.sorted { $0.transactionDate > $1.transactionDate } // Sort by date (descending)
            }
            .eraseToAnyPublisher()
    }
}
