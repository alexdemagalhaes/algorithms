//
//  InsertionSortTests.swift
//  AlgorithmsTests
//
//  Created by Alex Magalhaes on 08/26/20.
//  Copyright © 2020 Alex Machado. All rights reserved.
//

@testable import Algorithms
import XCTest

class InsertionSortTests: XCTestCase {
    func testIntArrayIsSortedCorrectly1() {
        let insertionSort = InsertionSort(input: [5, 2, 4, 6, 1, 3])
        let sortedArray = insertionSort.sort()
        XCTAssertEqual(sortedArray, [1, 2, 3, 4, 5, 6])
    }

    func testIntArrayIsSortedCorrectly2() {
        let insertionSort = InsertionSort(input: [31, 41, 59, 26, 41, 58])
        let sortedArray = insertionSort.sort()
        XCTAssertEqual(sortedArray, [26, 31, 41, 41, 58, 59])
    }
}
