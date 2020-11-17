//
//  MaximumSubarrayProblemSolver.swift
//  Algorithms
//
//  Created by Alex Magalhaes on 10/29/20.
//  Copyright © 2020 Alex Machado. All rights reserved.
//

public struct Subarray<Number: SignedNumeric & Comparable>: Equatable {
    let low: Int
    let high: Int
    let sum: Number
}

public protocol MaximumSubarrayProblemSolver {
    associatedtype Number: SignedNumeric & Comparable

    func findMaximumSubarray() -> Subarray<Number>?
}

struct AnyMaximumSubarrayProblemSolver<Number: SignedNumeric & Comparable> {
    private let findMaximumSubarrayMethod: () -> Subarray<Number>?

    init<Algorithm: MaximumSubarrayProblemSolver>(_ algorithm: Algorithm) where Algorithm.Number == Number {
        self.findMaximumSubarrayMethod = algorithm.findMaximumSubarray
    }

    func findMaximumSubarray() -> Subarray<Number>? {
        return findMaximumSubarrayMethod()
    }
}
