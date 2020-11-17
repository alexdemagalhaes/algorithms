//
//  DivideAndConquerMaximumSubarrayProblemSolver.swift
//  Algorithms
//
//  Created by Alex Magalhaes on 11/13/20.
//  Copyright © 2020 Alex Machado. All rights reserved.
//

public class DivideAndConquerMaximumSubarrayProblemSolver<Number: SignedNumeric & Comparable>: MaximumSubarrayProblemSolver {
    private let array: [Number]

    init(input: [Number]) {
        array = input
    }

    public func findMaximumSubarray() -> Subarray<Number>? {
        guard !array.isEmpty else { return nil }

        return findMaximumSubarray(low: 0, high: array.count-1)
    }

    private func findMaximumSubarray(low: Int, high: Int) -> Subarray<Number> {
        guard low != high else {
            return Subarray(low: low, high: high, sum: array[low])
        }

        let mid = (low + high + 1) / 2
        let leftMaximumSubarray = findMaximumSubarray(low: low, high: mid-1)
        let rightMaximumSubarray = findMaximumSubarray(low: mid, high: high)
        let crossMaximumSubarray = findMaxCrossingSubarray(low: low, mid: mid, high: high)
        if leftMaximumSubarray.sum >= rightMaximumSubarray.sum && leftMaximumSubarray.sum >= crossMaximumSubarray.sum {
            return leftMaximumSubarray
        }
        if rightMaximumSubarray.sum >= leftMaximumSubarray.sum && rightMaximumSubarray.sum >= crossMaximumSubarray.sum {
            return rightMaximumSubarray
        }
        return crossMaximumSubarray
    }

    private func findMaxCrossingSubarray(low: Int, mid: Int, high: Int) -> Subarray<Number> {
        var maxLeft = -1
        var maxRight = -1

        var leftSum: Number!
        var sum: Number = 0
        for i in (low..<mid).reversed() {
            sum += array[i]
            if leftSum == nil || sum > leftSum {
                leftSum = sum
                maxLeft = i
            }
        }
        var rightSum: Number!
        sum = 0
        for j in mid...high {
            sum += array[j]
            if rightSum == nil || sum > rightSum {
                rightSum = sum
                maxRight = j
            }
        }
        return Subarray(low: maxLeft, high: maxRight, sum: leftSum + rightSum)
    }
}
