//
//  BruteForceMaximumSubarrayProblemSolver.swift
//  Algorithms
//
//  Created by Alex Magalhaes on 10/29/20.
//  Copyright © 2020 Alex Machado. All rights reserved.
//

public class BruteForceMaximumSubarrayProblemSolver<Number: SignedNumeric & Comparable>: MaximumSubarrayProblemSolver {
    private let array: [Number]

    init(input: [Number]) {
        array = input
    }

    public func findMaximumSubarray() -> Subarray<Number>? {
        guard !array.isEmpty else { return nil }

        var low = 0
        var high = 0
        var maxSum = array[0]
        var sum: Number = 0
        for i in 0..<array.count-1 {
            sum = 0
            for j in i..<array.count {
                sum += array[j]
                if sum > maxSum {
                    maxSum = sum
                    low = i
                    high = j
                }
            }
        }

        return Subarray(low: low, high: high, sum: maxSum)
    }
}
