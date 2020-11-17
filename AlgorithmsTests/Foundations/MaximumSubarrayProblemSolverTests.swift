//
//  MaximumSubarrayProblemSolverTests.swift
//  AlgorithmsTests
//
//  Created by Alex Magalhaes on 10/29/20.
//  Copyright © 2020 Alex Machado. All rights reserved.
//

@testable import Algorithms
import XCTest

final class MaximumSubarrayProblemSolverTests: XCTestCase {
    private func testMaximumSubarrayProblemAlgorithms<Number: SignedNumeric & Comparable>(
        withInput input: [Number],
        expectedOutput: Subarray<Number>?
    ) {
        let algorithms: [(AnyMaximumSubarrayProblemSolver<Number>, Subarray<Number>?)] = [
            (AnyMaximumSubarrayProblemSolver(BruteForceMaximumSubarrayProblemSolver(input: input)), expectedOutput),
            (AnyMaximumSubarrayProblemSolver(DivideAndConquerMaximumSubarrayProblemSolver(input: input)), expectedOutput)
        ]
        algorithms.forEach { (algorithm, expectedOutput) in
            XCTAssertEqual(algorithm.findMaximumSubarray(), expectedOutput)
        }
    }

    func testMaximumProfitStartingAtLowestPriceButNotEndingAtHighestPrice() {
        let array = [13, -3, -25, 20, -3, -16, -23, 18, 20, -7, 12, -5, -22, 15, -4, 7]
        let maximumSubarray = Subarray(low: 7, high: 10, sum: 43)
        testMaximumSubarrayProblemAlgorithms(withInput: array, expectedOutput: maximumSubarray)
    }

    func testMaximumProfitNotStartingAtLowestPriceAndNotEndingAtHighestPrice() {
        let array = [1, -4, 3, -4]
        let maximumSubarray = Subarray(low: 2, high: 2, sum: 3)
        testMaximumSubarrayProblemAlgorithms(withInput: array, expectedOutput: maximumSubarray)
    }

    func testMaximumProfitWhenAllElementsAreNegative() {
        let array = [-9, -4, -1, -5]
        let maximumSubarray = Subarray(low: 2, high: 2, sum: -1)
        testMaximumSubarrayProblemAlgorithms(withInput: array, expectedOutput: maximumSubarray)
    }

    func testMaximumProfitWithSingleElement() {
        let array = [3]
        let maximumSubarray = Subarray(low: 0, high: 0, sum: 3)
        testMaximumSubarrayProblemAlgorithms(withInput: array, expectedOutput: maximumSubarray)
    }

    func testMaximumProfitCrossingMidpointOfTheArray() {
        let array = [1, -2, 3, -2, 3, -1, 2, -5, 3, -1, 2]
        let maximumSubarray = Subarray(low: 2, high: 6, sum: 5)
        testMaximumSubarrayProblemAlgorithms(withInput: array, expectedOutput: maximumSubarray)
    }

    func testMaximumProfitIsNilForEmptyArray() {
        testMaximumSubarrayProblemAlgorithms(withInput: [Int](), expectedOutput: nil)
    }
}
