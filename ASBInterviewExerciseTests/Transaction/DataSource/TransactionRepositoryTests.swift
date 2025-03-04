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
    
    func testFetchTransactionsSuccess() {
        let remoteDataSource = RemoteTransactionDataSource()
        let mockDataSource = MockTransactionDataSource()
        let repository = TransactionRepository(remoteDataSource: remoteDataSource, mockDataSource: mockDataSource)
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
        
        if ProcessInfo.isRunningOnSimulator {
            XCTAssertNil(receivedError)
            XCTAssertNotNil(receivedTransactions)
            XCTAssertEqual(receivedTransactions?.count, 4)
        } else {
            XCTAssertNil(receivedError)
            XCTAssertNotNil(receivedTransactions)
            XCTAssertGreaterThan(receivedTransactions?.count ?? 0, 0, "Should receive transactions")
        }
    }
}
