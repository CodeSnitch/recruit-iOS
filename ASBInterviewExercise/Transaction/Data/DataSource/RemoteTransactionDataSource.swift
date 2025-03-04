//
//  RemoteTransactionDataSource.swift
//  ASBInterviewExercise
//
//  Created by Ray Liu on 04/03/2025.
//
import Foundation
import Combine

class RemoteTransactionDataSource: TransactionRepositoryProtocol {
    func fetchTransactions() -> AnyPublisher<[TransactionEntity], Error> {
        guard let url = URL(string: "https://gist.githubusercontent.com/Josh-Ng/500f2716604dc1e8e2a3c6d31ad01830/raw/4d73acaa7caa1167676445c922835554c5572e82/test-data.json") else {
            return Fail(error: URLError(.badURL)).eraseToAnyPublisher()
        }

        return URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: [TransactionEntity].self, decoder: JSONDecoder())
            .mapError { error -> Error in
                print("Network or Decoding error: \(error)")
                return error
            }
            .eraseToAnyPublisher()
    }
}
