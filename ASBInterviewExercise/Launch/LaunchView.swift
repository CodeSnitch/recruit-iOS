//
//  LaunchView.swift
//  ASBInterviewExercise
//
//  Created by Ray Liu on 04/03/2025.
//
import SwiftUI
import Swinject

let container = Container()

func registerDependencies() {
    // Data Layer
    container.register(RemoteTransactionDataSource.self) { _ in RemoteTransactionDataSource() }
    container.register(MockTransactionDataSource.self) { _ in MockTransactionDataSource() }

    container.register(TransactionRepositoryProtocol.self) { r in
        TransactionRepository(remoteDataSource: r.resolve(RemoteTransactionDataSource.self)!, mockDataSource: r.resolve(MockTransactionDataSource.self)!)
    }

    // Domain Layer
    container.register(FetchTransactionUseCaseProtocol.self) { r in
        FetchTransactionUseCase(repository: r.resolve(TransactionRepositoryProtocol.self)!)
    }

    // Presentation Layer
    container.register(TransactionListViewModel.self) { r in
        TransactionListViewModel(fetchTransactionsUseCase: r.resolve(FetchTransactionUseCaseProtocol.self)!)
    }
}

struct LaunchView: View {
    init() {
        registerDependencies()
    }
    var body: some View {
        VStack {
            TransactionListView(viewModel: container.resolve(TransactionListViewModel.self)!)
        }
        .padding()
    }
}

#Preview {
    LaunchView()
}
