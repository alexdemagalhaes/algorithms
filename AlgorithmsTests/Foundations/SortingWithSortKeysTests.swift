//
//  SortingWithSortKeysTests.swift
//  AlgorithmsTests
//
//  Created by Alex Magalhaes on 12/20/23.
//  Copyright © 2023 Alex Machado. All rights reserved.
//

@testable import Algorithms
import XCTest

private struct TestElement {
    let value: String
}

final class SortingWithSortKeysTests: XCTestCase {
    private func testSortingAlgorithms<ComparableType: Comparable>(
        withInput input: [TestElement],
        sortKeys: [ComparableType],
        expectedOutput: [TestElement]
    ) {
        let algorithms: [any SortingWithSortKeysAlgorithm] = [
            MergeSortWithSortKeys(input: input, sortKeys: sortKeys)
        ]
        algorithms.forEach { algorithm in
            let sortedArray = algorithm.sort().map { $0 as! TestElement }
            for i in 0..<sortedArray.count {
                XCTAssertEqual(sortedArray[i].value, expectedOutput[i].value)
            }
        }
    }

    func testIntArray1IsSortedCorrectly() {
        let input: [TestElement] = [
            .init(value: "A"),
            .init(value: "B"),
            .init(value: "C"),
            .init(value: "D"),
            .init(value: "E"),
            .init(value: "F")
        ]
        let sortKeys = [5, 2, 4, 6, 1, 3]
        let expectedOutput: [TestElement] = [
            .init(value: "E"),
            .init(value: "B"),
            .init(value: "F"),
            .init(value: "C"),
            .init(value: "A"),
            .init(value: "D")
        ]
        testSortingAlgorithms(withInput: input, sortKeys: sortKeys, expectedOutput: expectedOutput)
    }

    func testIntArray2IsSortedCorrectly() {
        let input: [TestElement] = [
            .init(value: "A"),
            .init(value: "B"),
            .init(value: "C"),
            .init(value: "D"),
            .init(value: "E"),
            .init(value: "F")
        ]
        let sortKeys = [31, 41, 59, 26, 0, 58]
        let expectedOutput: [TestElement] = [
            .init(value: "E"),
            .init(value: "D"),
            .init(value: "A"),
            .init(value: "B"),
            .init(value: "F"),
            .init(value: "C")
        ]
        testSortingAlgorithms(withInput: input, sortKeys: sortKeys, expectedOutput: expectedOutput)
    }

    func testDoubleArray1IsSortedCorrectly() {
        let input: [TestElement] = [
            .init(value: "A"),
            .init(value: "B"),
            .init(value: "C"),
            .init(value: "D"),
            .init(value: "E"),
            .init(value: "F")
        ]
        let sortKeys = [1.3, 7.8, 0, Double.greatestFiniteMagnitude, 5, -1]
        let expectedOutput: [TestElement] = [
            .init(value: "F"),
            .init(value: "C"),
            .init(value: "A"),
            .init(value: "E"),
            .init(value: "B"),
            .init(value: "D")
        ]
        testSortingAlgorithms(withInput: input, sortKeys: sortKeys, expectedOutput: expectedOutput)
    }

    func testDoubleArray2IsSortedCorrectly() {
        let input: [TestElement] = [
            .init(value: "A"),
            .init(value: "B"),
            .init(value: "C"),
            .init(value: "D"),
            .init(value: "E"),
            .init(value: "F")
        ]
        let sortKeys = [0.34, -500.1, 0.344, 45.6, -0.34, 0]
        let expectedOutput: [TestElement] = [
            .init(value: "B"),
            .init(value: "E"),
            .init(value: "F"),
            .init(value: "A"),
            .init(value: "C"),
            .init(value: "D")
        ]
        testSortingAlgorithms(withInput: input, sortKeys: sortKeys, expectedOutput: expectedOutput)
    }
}
