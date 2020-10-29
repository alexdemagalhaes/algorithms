//
//  BruteForceMaximumSubarrayProblemSolver.swift
//  Algorithms
//
//  Created by Alex Magalhaes on 10/29/20.
//  Copyright © 2020 Alex Machado. All rights reserved.
//

public class BruteForceMaximumSubarrayProblemSolver<ComparableType: Comparable>: MaximumSubarrayProblemSolver {
    private let array: [ComparableType]
    private let evaluator: SubarrayEvaluator<ComparableType>

    init(input: [ComparableType], evaluator: @escaping SubarrayEvaluator<ComparableType>) {
        array = input
        self.evaluator = evaluator
    }

    public func solveMaximumSubarrayProblem() -> ArraySlice<ComparableType>? {
        guard array.count > 1 else { return nil }

        var subarray: ArraySlice<ComparableType>?
        for i in 0..<array.count-1 {
            for j in i+1..<array.count {
                let newSubarray = array[i...j]
                if let oldSubarray = subarray {
                    subarray = evaluator(oldSubarray, newSubarray)
                } else {
                    subarray = newSubarray
                }
            }
        }
        return subarray
    }
}
