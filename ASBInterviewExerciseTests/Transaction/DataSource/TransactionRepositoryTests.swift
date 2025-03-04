//
//  TransactionRepositoryTests.swift
//  ASBInterviewExercise
//
//  Created by Ray Liu on 04/03/2025.
//
import XCTest
import Combine
@testable import ASBInterviewExercise

class TransactionRepositoryTests: XCTestCase {
    
    func testFetchTransactionsSuccess_Remote() {
        let remoteDataSource = RemoteTransactionDataSource()
        let repository = TransactionRepository(remoteDataSource: remoteDataSource)
        let expectation = XCTestExpectation(description: "Fetch transactions from repository")
        var receivedTransactions: [TransactionEntity]?
        var receivedError: Error?
        
        let cancellable = repository.fetchTransactions()
        .sink(receiveCompletion: { completion in
            switch completion {
            case .finished:
                break
            case .failure(let error):
                receivedError = error
            }
            expectation.fulfill()
        }, receiveValue: { transactions in
            receivedTransactions = transactions
        })
        
        wait(for: [expectation], timeout: 5.0)
        cancellable.cancel()
        
        XCTAssertNil(receivedError)
        XCTAssertNotNil(receivedTransactions)
        XCTAssertEqual(receivedTransactions?.count, 1000)
    }
}
