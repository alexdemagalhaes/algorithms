//
//  SortingTests.swift
//  AlgorithmsTests
//
//  Created by Alex Magalhaes on 09/22/20.
//  Copyright © 2020 Alex Machado. All rights reserved.
//

@testable import Algorithms
import XCTest

final class SortingTests: XCTestCase {
    private func testSortingAlgorithms<ComparableType: Comparable>(withInput input: [ComparableType], expectedOutput: [ComparableType]) {
        let algorithms: [AnySortingAlgorithm<ComparableType>] = [
            AnySortingAlgorithm(InsertionSort(input: input)),
            AnySortingAlgorithm(SelectionSort(input: input)),
            AnySortingAlgorithm(MergeSort(input: input))
        ]
        algorithms.forEach { algorithm in
            XCTAssertEqual(algorithm.sort(), expectedOutput)
        }
    }

    func testEmptyIntArrayIsSortedCorrectly() {
        testSortingAlgorithms(withInput: [Int](), expectedOutput: [Int]())
    }

    func testEmptyDoubleArrayIsSortedCorrectly() {
        testSortingAlgorithms(withInput: [Double](), expectedOutput: [Double]())
    }

    func testSingleIntElementIsSortedCorrectly() {
        testSortingAlgorithms(withInput: [42], expectedOutput: [42])
    }

    func testSingleDoubleElementIsSortedCorrectly() {
        testSortingAlgorithms(withInput: [3.1415], expectedOutput: [3.1415])
    }

    func testIntArray1IsSortedCorrectly() {
        testSortingAlgorithms(withInput: [5, 2, 4, 6, 1, 3], expectedOutput: [1, 2, 3, 4, 5, 6])
    }

    func testIntArray2IsSortedCorrectly() {
        testSortingAlgorithms(withInput: [31, 41, 59, 26, 41, 58], expectedOutput: [26, 31, 41, 41, 58, 59])
    }

    func testDoubleArray1IsSortedCorrectly() {
        testSortingAlgorithms(withInput: [1.3, 7.8, 0, Double.greatestFiniteMagnitude, -1, 5], expectedOutput: [-1, 0, 1.3, 5, 7.8, Double.greatestFiniteMagnitude])
    }

    func testDoubleArray2IsSortedCorrectly() {
        testSortingAlgorithms(withInput: [0.34, -500.1, 0.344, 45.6, 0.34, 0], expectedOutput: [-500.1, 0, 0.34, 0.34, 0.344, 45.6])
    }

    func testSortingAThousandNumbers() {
        testSortingAlgorithms(withInput: Numbers.thousandRandomNumbers, expectedOutput: Numbers.thousandRandomNumbers.sorted())
    }
}
