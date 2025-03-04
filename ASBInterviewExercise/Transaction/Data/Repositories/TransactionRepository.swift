//
//  TransactionRepository.swift
//  ASBInterviewExercise
//
//  Created by Ray Liu on 04/03/2025.
//
import Combine

class TransactionRepository: TransactionRepositoryProtocol {
    private let remoteDataSource: RemoteTransactionDataSource

    init(remoteDataSource: RemoteTransactionDataSource) {
        self.remoteDataSource = remoteDataSource
    }
    
    func fetchTransactions() -> AnyPublisher<[TransactionEntity], Error> {
        return remoteDataSource.fetchTransactions()
    }
}
