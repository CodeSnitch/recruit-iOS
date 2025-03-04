//
//  TransactionListViewModelTests.swift
//  ASBInterviewExercise
//
//  Created by Ray Liu on 04/03/2025.
//

import XCTest
import Combine
@testable import ASBInterviewExercise

class TransactionListViewModelTests: XCTestCase {
    func testFetchTransactionsSuccess() {
        let mockDataSource = MockTransactionDataSource()
        let remoteDataSource = RemoteTransactionDataSource()
        let mockRepository = TransactionRepository(remoteDataSource: remoteDataSource, mockDataSource: mockDataSource)
        let mockUseCase = FetchTransactionUseCase(repository: mockRepository)
        let viewModel = TransactionListViewModel(fetchTransactionsUseCase: mockUseCase)
        let expectation = XCTestExpectation(description: "Fetch transactions and update ViewModel")
        
        let cancellable = viewModel.$transactions
            .dropFirst() // Important: Skip the initial empty array
            .sink { transactions in
                if ProcessInfo.isRunningOnSimulator {
                    XCTAssertEqual(transactions.count, 4)
                } else {
                    XCTAssertEqual(transactions.count, 1000)
                }
                // Add checks for other properties as needed
                expectation.fulfill()
            }
        
        viewModel.fetchTransactions()
        wait(for: [expectation], timeout: 5)
        cancellable.cancel()
    }
}
