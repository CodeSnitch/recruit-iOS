//
//  MockTransactionDataSource.swift
//  ASBInterviewExercise
//
//  Created by Ray Liu on 04/03/2025.
//
import Foundation
import Combine

class MockTransactionDataSource: TransactionRepositoryProtocol {
    func fetchTransactions() -> AnyPublisher<[TransactionEntity], Error> {
        // Simulate network delay and potential errors
        let sampleData = """
        [{"id":1,"transactionDate":"2021-08-31T15:47:10","summary":"Hackett, Stamm and Kuhn","debit":9379.55,"credit":0},
        {"id":2,"transactionDate":"2022-02-17T10:44:35","summary":"Hettinger, Wilkinson and Kshlerin","debit":3461.35,"credit":0},
        {"id":3,"transactionDate":"2021-02-21T08:19:12","summary":"McKenzie, Bins and Macejkovic","debit":0,"credit":1415.74},
        {"id":4,"transactionDate":"2021-12-15T14:35:20","summary":"Treutel, Schaden and Pfannerstill","debit":1639.43,"credit":0}]
        """.data(using: .utf8)!

        return Just(sampleData)
            .delay(for: .seconds(0.5), scheduler: DispatchQueue.main) // Simulate network delay
            .decode(type: [TransactionEntity].self, decoder: JSONDecoder())
            .mapError { $0 as Error } // Cast to Error
            .eraseToAnyPublisher()
    }
}
