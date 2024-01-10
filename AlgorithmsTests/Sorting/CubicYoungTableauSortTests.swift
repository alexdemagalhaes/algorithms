//
//  CubicYoungTableauSortTests.swift
//  AlgorithmsTests
//
//  Created by Alex Magalhaes on 1/10/24.
//  Copyright © 2024 Alex Machado. All rights reserved.
//

@testable import Algorithms
import XCTest

final class CubicYoungTableauSortTests: XCTestCase {
    private func testSortingAlgorithms<ComparableType: Comparable>(withInput input: [ComparableType], expectedOutput: [ComparableType]) {
        let algorithms: [AnySortingAlgorithm<ComparableType>] = [
            AnySortingAlgorithm(CubicYoungTableauSort(input: input))
        ]
        algorithms.forEach { algorithm in
            XCTAssertEqual(algorithm.sort(), expectedOutput)
        }
    }

    func testSingleIntElementIsSortedCorrectly() {
        testSortingAlgorithms(withInput: [42], expectedOutput: [42])
    }

    func testSingleDoubleElementIsSortedCorrectly() {
        testSortingAlgorithms(withInput: [3.1415], expectedOutput: [3.1415])
    }

    func testIntArray1IsSortedCorrectly() {
        testSortingAlgorithms(withInput: [5, 2, 4, 6], expectedOutput: [2, 4, 5, 6])
    }

    func testIntArray2IsSortedCorrectly() {
        testSortingAlgorithms(withInput: [59, 26, 41, 58], expectedOutput: [26, 41, 58, 59])
    }

    func testDoubleArrayIsSortedCorrectly() {
        testSortingAlgorithms(withInput: [1.3, 7.8, 0, Double.greatestFiniteMagnitude,
                                          -1, 5, -2, 7,
                                          1, -2.5, 8, 2,
                                          1.5, 4, 0.5, -0.5],
                              expectedOutput: [-2.5, -2, -1, -0.5,
                                                0, 0.5, 1, 1.3,
                                                1.5, 2, 4, 5,
                                                7, 7.8, 8, Double.greatestFiniteMagnitude])
    }
}
