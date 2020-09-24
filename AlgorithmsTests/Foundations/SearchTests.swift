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
    private func testSearchAlgorithms<ComparableType: Comparable>(withInput input: [ComparableType], value: ComparableType) {
        let algorithms: [(AnySearchAlgorithm<ComparableType>, Int?)] = [
            (AnySearchAlgorithm(LinearSearch(input: input)), input.firstIndex(of: value)),
            (AnySearchAlgorithm(BinarySearch(input: input.sorted())), input.sorted().firstIndex(of: value))
        ]
        algorithms.forEach { (algorithm, expectedIndex) in
            XCTAssertEqual(algorithm.search(for: value), expectedIndex)
        }
    }

    func testEmptyIntArrayDoesNotContainValue() {
        testSearchAlgorithms(withInput: [Int](), value: 42)
    }

    func testEmptyDoubleArrayDoesNotContainValue() {
        testSearchAlgorithms(withInput: [Double](), value: 3.1415)
    }

    func testSingleIntElementContainsValueCorrectly() {
        testSearchAlgorithms(withInput: [23], value: 23)
    }

    func testSingleIntElementDoesNotContainValueCorrectly() {
        testSearchAlgorithms(withInput: [23], value: 108)
    }

    func testSingleDoubleElementContainsValueCorrectly() {
        testSearchAlgorithms(withInput: [1.99], value: 1.99)
    }

    func testSingleDoubleElementDoesNotContainValueCorrectly() {
        testSearchAlgorithms(withInput: [1.99], value: 10.8)
    }

    func testIntArrayContainsValue1Correctly() {
        testSearchAlgorithms(withInput: [5, 2, 4, 6, 1, 3], value: 6)
    }

    func testIntArrayContainsValue2Correctly() {
        testSearchAlgorithms(withInput: [5, 2, 4, 6, 1, 3], value: 5)
    }

    func testIntArrayDoesNotContainValueCorrectly() {
        testSearchAlgorithms(withInput: [5, 2, 4, 6, 1, 3], value: 7)
    }

    func testDoubleArrayContainsValue1Correctly() {
        testSearchAlgorithms(withInput: [0.5, 0.1, 34.5, 500, -45.0, -5.0], value: 0.1)
    }

    func testDoubleArrayContainsValue2Correctly() {
        testSearchAlgorithms(withInput: [0.5, 0.1, 34.5, 500, -45.0, -5.0], value: -5.0)
    }

    func testDoubleArrayDoesNotContainValueCorrectly() {
        testSearchAlgorithms(withInput: [0.5, 0.1, 34.5, 500, -45.0, -5.0], value: 1.1)
    }

    func testSearchingThroughAThousandNumbersFindsValueCorrectly() {
        testSearchAlgorithms(withInput: Numbers.thousandRandomNumbers, value: 163144)
    }

    func testSearchingThroughAThousandNumbersDoesNotFindValueCorrectly() {
        testSearchAlgorithms(withInput: Numbers.thousandRandomNumbers, value: 481516)
    }
}
