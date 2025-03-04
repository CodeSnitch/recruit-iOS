//
//  FetchTransactionUseCaseTests.swift
//  ASBInterviewExercise
//
//  Created by Ray Liu on 04/03/2025.
//
import XCTest
import Combine
@testable import ASBInterviewExercise

class FetchTransactionUseCaseTests: XCTestCase {
    
    func testExecuteSuccess() {
        let mockDataSource = MockTransactionDataSource()
        let remoteDataSource = RemoteTransactionDataSource()
        let mockRepository = TransactionRepository(remoteDataSource: remoteDataSource, mockDataSource: mockDataSource)
        let useCase = FetchTransactionUseCase(repository: mockRepository)
        let expectation = XCTestExpectation(description: "Execute use case")
        var receivedTransactions: [Transaction]?
        var receivedError: Error?
        
        let cancellable = useCase.execute()
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
            XCTAssertTrue(receivedTransactions?.first?.transactionDate is Date)
        } else {
            XCTAssertNil(receivedError)
            XCTAssertNotNil(receivedTransactions)
            XCTAssertEqual(receivedTransactions?.count, 1000)
            XCTAssertTrue(receivedTransactions?.first?.transactionDate is Date)
        }
        
    }
}
