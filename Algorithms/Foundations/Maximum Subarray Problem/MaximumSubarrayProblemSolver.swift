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

public typealias SubarrayEvaluator<Number: SignedNumeric & Comparable> = (ArraySlice<Number>, ArraySlice<Number>) -> ArraySlice<Number>

public protocol MaximumSubarrayProblemSolver {
    associatedtype Number: SignedNumeric & Comparable

    func solveMaximumSubarrayProblem() -> Subarray<Number>?
}

struct AnyMaximumSubarrayProblemSolver<Number: SignedNumeric & Comparable> {
    private let problemSolvingMethod: () -> Subarray<Number>?

    init<Algorithm: MaximumSubarrayProblemSolver>(_ algorithm: Algorithm) where Algorithm.Number == Number {
        self.problemSolvingMethod = algorithm.solveMaximumSubarrayProblem
    }

    func solveMaximumSubarrayProblem() -> Subarray<Number>? {
        return problemSolvingMethod()
    }
}
