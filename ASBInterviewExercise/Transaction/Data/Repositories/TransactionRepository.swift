//
//  TransactionRepository.swift
//  ASBInterviewExercise
//
//  Created by Ray Liu on 04/03/2025.
//
import Combine

class TransactionRepository: TransactionRepositoryProtocol {
    private let remoteDataSource: RemoteTransactionDataSource
    private let mockDataSource: MockTransactionDataSource

    init(remoteDataSource: RemoteTransactionDataSource, mockDataSource: MockTransactionDataSource) {
        self.remoteDataSource = remoteDataSource
        self.mockDataSource = mockDataSource
    }
    
    func fetchTransactions() -> AnyPublisher<[TransactionEntity], Error> {
        #if DEBUG
        return mockDataSource.fetchTransactions()
        #else
        return remoteDataSource.fetchTransactions()
        #endif
    }
}
