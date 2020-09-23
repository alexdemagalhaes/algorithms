//
//  SearchTests.swift
//  AlgorithmsTests
//
//  Created by Alex Magalhaes on 09/23/20.
//  Copyright © 2020 Alex Machado. All rights reserved.
//

@testable import Algorithms
import XCTest

class SearchTests: XCTestCase {
    private func testSearchAlgorithms<ComparableType: Comparable>(withInput input: [ComparableType], value: ComparableType, expectedIndex: Int?) {
        let algorithms: [AnySearchAlgorithm<ComparableType>] = [
            AnySearchAlgorithm(LinearSearch(input: input))
        ]
        algorithms.forEach { algorithm in
            XCTAssertEqual(algorithm.search(for: value), expectedIndex)
        }
    }

    func testEmptyIntArrayDoesNotContainValue() {
        testSearchAlgorithms(withInput: [Int](), value: 42, expectedIndex: nil)
    }

    func testEmptyDoubleArrayDoesNotContainValue() {
        testSearchAlgorithms(withInput: [Double](), value: 3.1415, expectedIndex: nil)
    }

    func testSingleIntElementContainsValueCorrectly() {
        testSearchAlgorithms(withInput: [23], value: 23, expectedIndex: 0)
    }

    func testSingleIntElementDoesNotContainValueCorrectly() {
        testSearchAlgorithms(withInput: [23], value: 108, expectedIndex: nil)
    }

    func testSingleDoubleElementContainsValueCorrectly() {
        testSearchAlgorithms(withInput: [1.99], value: 1.99, expectedIndex: 0)
    }

    func testSingleDoubleElementDoesNotContainValueCorrectly() {
        testSearchAlgorithms(withInput: [1.99], value: 10.8, expectedIndex: nil)
    }

    func testIntArrayContainsValue1Correctly() {
        testSearchAlgorithms(withInput: [5, 2, 4, 6, 1, 3], value: 6, expectedIndex: 3)
    }

    func testIntArrayContainsValue2Correctly() {
        testSearchAlgorithms(withInput: [5, 2, 4, 6, 1, 3], value: 5, expectedIndex: 0)
    }

    func testIntArrayDoesNotContainValueCorrectly() {
        testSearchAlgorithms(withInput: [5, 2, 4, 6, 1, 3], value: 7, expectedIndex: nil)
    }

    func testDoubleArrayContainsValue1Correctly() {
        testSearchAlgorithms(withInput: [0.5, 0.1, 34.5, 500, -45.0, -5.0], value: 0.1, expectedIndex: 1)
    }

    func testDoubleArrayContainsValue2Correctly() {
        testSearchAlgorithms(withInput: [0.5, 0.1, 34.5, 500, -45.0, -5.0], value: -5.0, expectedIndex: 5)
    }

    func testDoubleArrayDoesNotContainValueCorrectly() {
        testSearchAlgorithms(withInput: [0.5, 0.1, 34.5, 500, -45.0, -5.0], value: 1.1, expectedIndex: nil)
    }

    func testSearchingThroughAThousandNumbersFindsValueCorrectly() {
        testSearchAlgorithms(withInput: Numbers.thousandRandomNumbers, value: 163144, expectedIndex: 108)
    }

    func testSearchingThroughAThousandNumbersDoesNotFindValueCorrectly() {
        testSearchAlgorithms(withInput: Numbers.thousandRandomNumbers, value: 481516, expectedIndex: nil)
    }
}
