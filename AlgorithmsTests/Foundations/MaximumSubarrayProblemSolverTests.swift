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
    private func testMaximumSubarrayProblemAlgorithms<ComparableType: Comparable>(withInput input: [ComparableType],
                                                                                  evaluator: @escaping SubarrayEvaluator<ComparableType>,
                                                                                  expectedOutput: ArraySlice<ComparableType>?) {
        let algorithms: [(AnyMaximumSubarrayProblemSolver<ComparableType>, ArraySlice<ComparableType>?)] = [
            (AnyMaximumSubarrayProblemSolver(BruteForceMaximumSubarrayProblemSolver(input: input, evaluator: evaluator)), expectedOutput)
        ]
        algorithms.forEach { (algorithm, expectedOutput) in
            XCTAssertEqual(algorithm.solveMaximumSubarrayProblem(), expectedOutput)
        }
    }

    private func volatileChemicalCorporationEvaluator(lhs: ArraySlice<Int>, rhs: ArraySlice<Int>) -> ArraySlice<Int> {
        XCTAssertNotNil(lhs.first)
        XCTAssertNotNil(lhs.last)
        XCTAssertNotNil(rhs.first)
        XCTAssertNotNil(rhs.last)

        let lhsProfit = lhs.last! - lhs.first!
        let rhsProfit = rhs.last! - rhs.first!
        if rhsProfit > lhsProfit {
            return rhs
        } else {
            return lhs
        }
    }

    func testMaximumProfitStartingAtLowestPriceButNotEndingAtHighestPrice() {
        let array = [100, 113, 110, 85, 105, 102, 86, 63, 81, 101, 94, 106, 101, 79, 94, 90, 97]
        testMaximumSubarrayProblemAlgorithms(withInput: array, evaluator: volatileChemicalCorporationEvaluator, expectedOutput: array[7...11])
    }

    func testMaximumProfitNotStartingAtLowestPriceAndNotEndingAtHighestPrice() {
        let array = [10, 11, 7, 10, 6]
        testMaximumSubarrayProblemAlgorithms(withInput: array, evaluator: volatileChemicalCorporationEvaluator, expectedOutput: array[2...3])
    }
}
