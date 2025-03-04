//
//  FetchTransactionUseCaseProtocol.swift
//  ASBInterviewExercise
//
//  Created by Ray Liu on 04/03/2025.
//
import Combine

protocol FetchTransactionUseCaseProtocol {
    func execute() -> AnyPublisher<[Transaction], Error>
}
