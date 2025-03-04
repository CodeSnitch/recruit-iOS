//
//  BuildConfiguration.swift
//  ASBInterviewExercise
//
//  Created by Ray Liu on 04/03/2025.
//

import Foundation

extension ProcessInfo {
    static var isRunningOnSimulator: Bool {
        #if targetEnvironment(simulator)
            return true
        #else
            return false
        #endif
    }
}
