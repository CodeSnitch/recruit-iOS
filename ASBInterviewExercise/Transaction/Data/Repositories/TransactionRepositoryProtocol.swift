//
//  TransactionRepositoryProtocol.swift
//  ASBInterviewExercise
//
//  Created by Ray Liu on 04/03/2025.
//

import Combine

protocol TransactionRepositoryProtocol {
    func fetchTransactions() -> AnyPublisher<[TransactionEntity], Error>
}
