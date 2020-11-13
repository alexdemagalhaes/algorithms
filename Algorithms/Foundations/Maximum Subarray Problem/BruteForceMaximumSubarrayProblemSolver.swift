//
//  BruteForceMaximumSubarrayProblemSolver.swift
//  Algorithms
//
//  Created by Alex Magalhaes on 10/29/20.
//  Copyright © 2020 Alex Machado. All rights reserved.
//

public class BruteForceMaximumSubarrayProblemSolver<Number: SignedNumeric & Comparable>: MaximumSubarrayProblemSolver {
    private let array: [Number]
    private let evaluator: SubarrayEvaluator<Number>

    init(input: [Number], evaluator: @escaping SubarrayEvaluator<Number>) {
        array = input
        self.evaluator = evaluator
    }

    public func solveMaximumSubarrayProblem() -> Subarray<Number>? {
        guard !array.isEmpty else { return nil }

        var subarray: ArraySlice<Number>?
        for i in 0..<array.count-1 {
            for j in i..<array.count {
                let newSubarray = array[i...j]
                if let oldSubarray = subarray {
                    subarray = evaluator(oldSubarray, newSubarray)
                } else {
                    subarray = newSubarray
                }
            }
        }

        if let subarray = subarray {
            return Subarray(low: subarray.startIndex, high: subarray.endIndex-1, sum: subarray.reduce(0, +))
        }

        return nil
    }
}
