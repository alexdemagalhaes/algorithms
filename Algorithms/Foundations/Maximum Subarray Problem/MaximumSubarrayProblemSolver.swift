//
//  MaximumSubarrayProblemSolver.swift
//  Algorithms
//
//  Created by Alex Magalhaes on 10/29/20.
//  Copyright © 2020 Alex Machado. All rights reserved.
//

public typealias SubarrayEvaluator<ComparableType: Comparable> = (ArraySlice<ComparableType>, ArraySlice<ComparableType>) -> ArraySlice<ComparableType>

public protocol MaximumSubarrayProblemSolver {
    associatedtype ComparableType: Comparable

    func solveMaximumSubarrayProblem() -> ArraySlice<ComparableType>?
}

struct AnyMaximumSubarrayProblemSolver<ComparableType: Comparable> {
    private let problemSolvingMethod: () -> ArraySlice<ComparableType>?

    init<Algorithm: MaximumSubarrayProblemSolver>(_ algorithm: Algorithm) where Algorithm.ComparableType == ComparableType {
        self.problemSolvingMethod = algorithm.solveMaximumSubarrayProblem
    }

    func solveMaximumSubarrayProblem() -> ArraySlice<ComparableType>? {
        return problemSolvingMethod()
    }
}
