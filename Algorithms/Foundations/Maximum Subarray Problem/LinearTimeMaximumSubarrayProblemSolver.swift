//
//  LinearTimeMaximumSubarrayProblemSolver.swift
//  Algorithms
//
//  Created by Alex Magalhaes on 11/18/20.
//  Copyright © 2020 Alex Machado. All rights reserved.
//

public class LinearTimeMaximumSubarrayProblemSolver<Number: SignedNumeric & Comparable>: MaximumSubarrayProblemSolver {
    private let array: [Number]

    init(input: [Number]) {
        array = input
    }

    public func findMaximumSubarray() -> Subarray<Number>? {
        guard !array.isEmpty else { return nil }

        var i = 0
        var maxSubarray: Subarray<Number>!
        var sum: Number!
        for j in 0..<array.count {
            if sum != nil && sum > 0 {
                sum += array[j]
            } else {
                sum = array[j]
                i = j
            }
            if maxSubarray == nil || sum > maxSubarray.sum {
                maxSubarray = Subarray(low: i, high: j, sum: sum)
            }
        }

        return maxSubarray
    }
}
