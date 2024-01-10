//
//  YoungTableauTests.swift
//  AlgorithmsTests
//
//  Created by Alex Magalhaes on 1/10/24.
//  Copyright © 2024 Alex Machado. All rights reserved.
//

@testable import Algorithms
import XCTest

final class YoungTableauTests: XCTestCase {
    func testExtractMinFull() {
        var youngTableau = YoungTableau(rows: 3, columns: 3, data: [1, 5, 8, 3, 7, 12, 9, 10, 13])
        XCTAssertEqual(youngTableau.data, [1, 5, 8,
                                           3, 7, 12,
                                           9, 10, 13])
        XCTAssertEqual(youngTableau.extractMin(), 1)
        XCTAssertEqual(youngTableau.data, [3, 5, 8,
                                           7, 10, 12,
                                           9, 13, nil])
        XCTAssertEqual(youngTableau.extractMin(), 3)
        XCTAssertEqual(youngTableau.data, [5, 8, 12,
                                           7, 10, nil,
                                           9, 13, nil])
        XCTAssertEqual(youngTableau.extractMin(), 5)
        XCTAssertEqual(youngTableau.data, [7, 8, 12,
                                           9, 10, nil,
                                           13, nil, nil])
        XCTAssertEqual(youngTableau.extractMin(), 7)
        XCTAssertEqual(youngTableau.data, [8, 10, 12,
                                           9, nil, nil,
                                           13, nil, nil])
        XCTAssertEqual(youngTableau.extractMin(), 8)
        XCTAssertEqual(youngTableau.data, [9, 10, 12,
                                           13, nil, nil,
                                           nil, nil, nil])
        XCTAssertEqual(youngTableau.extractMin(), 9)
        XCTAssertEqual(youngTableau.data, [10, 12, nil,
                                           13, nil, nil,
                                           nil, nil, nil])
        XCTAssertEqual(youngTableau.extractMin(), 10)
        XCTAssertEqual(youngTableau.data, [12, nil, nil,
                                           13, nil, nil,
                                           nil, nil, nil])
        XCTAssertEqual(youngTableau.extractMin(), 12)
        XCTAssertEqual(youngTableau.data, [13, nil, nil,
                                           nil, nil, nil,
                                           nil, nil, nil])
        XCTAssertEqual(youngTableau.extractMin(), 13)
        XCTAssertEqual(youngTableau.data, [nil, nil, nil,
                                           nil, nil, nil,
                                           nil, nil, nil])
        XCTAssertEqual(youngTableau.extractMin(), nil)
        XCTAssertEqual(youngTableau.data, [nil, nil, nil,
                                           nil, nil, nil,
                                           nil, nil, nil])
    }

    func testExtractMinNonFull() {
        var youngTableau = YoungTableau(rows: 4, columns: 4, data: [2, 3, 4, 5, 8, 9, 12, 14, 16])
        XCTAssertEqual(youngTableau.data, [2, 3, 4, 5,
                                           8, 9, 12, 14,
                                           16, nil, nil, nil,
                                           nil, nil, nil, nil])
        XCTAssertEqual(youngTableau.extractMin(), 2)
        XCTAssertEqual(youngTableau.data, [3, 4, 5, 14, 
                                           8, 9, 12, nil,
                                           16, nil, nil, nil,
                                           nil, nil, nil, nil])
        XCTAssertEqual(youngTableau.extractMin(), 3)
        XCTAssertEqual(youngTableau.data, [4, 5, 12, 14,
                                           8, 9, nil, nil,
                                           16, nil, nil, nil,
                                           nil, nil, nil, nil])
        XCTAssertEqual(youngTableau.extractMin(), 4)
        XCTAssertEqual(youngTableau.data, [5, 9, 12, 14,
                                           8, nil, nil, nil,
                                           16, nil, nil, nil,
                                           nil, nil, nil, nil])
        XCTAssertEqual(youngTableau.extractMin(), 5)
        XCTAssertEqual(youngTableau.data, [8, 9, 12, 14,
                                           16, nil, nil, nil,
                                           nil, nil, nil, nil,
                                           nil, nil, nil, nil])
        XCTAssertEqual(youngTableau.extractMin(), 8)
        XCTAssertEqual(youngTableau.data, [9, 12, 14, nil,
                                           16, nil, nil, nil,
                                           nil, nil, nil, nil,
                                           nil, nil, nil, nil])
        XCTAssertEqual(youngTableau.extractMin(), 9)
        XCTAssertEqual(youngTableau.data, [12, 14, nil, nil,
                                           16, nil, nil, nil,
                                           nil, nil, nil, nil,
                                           nil, nil, nil, nil])
        XCTAssertEqual(youngTableau.extractMin(), 12)
        XCTAssertEqual(youngTableau.data, [14, nil, nil, nil,
                                           16, nil, nil, nil,
                                           nil, nil, nil, nil,
                                           nil, nil, nil, nil])
        XCTAssertEqual(youngTableau.extractMin(), 14)
        XCTAssertEqual(youngTableau.data, [16, nil, nil, nil,
                                           nil, nil, nil, nil,
                                           nil, nil, nil, nil,
                                           nil, nil, nil, nil])
        XCTAssertEqual(youngTableau.extractMin(), 16)
        XCTAssertEqual(youngTableau.data, [nil, nil, nil, nil,
                                           nil, nil, nil, nil,
                                           nil, nil, nil, nil,
                                           nil, nil, nil, nil])
        XCTAssertEqual(youngTableau.extractMin(), nil)
        XCTAssertEqual(youngTableau.data, [nil, nil, nil, nil,
                                           nil, nil, nil, nil,
                                           nil, nil, nil, nil,
                                           nil, nil, nil, nil])
    }

    func testInsert() {
        var youngTableau = YoungTableau(rows: 2, columns: 3, data: [1.0, 5.0, 8.0, 3.0, 7.0])
        XCTAssertEqual(youngTableau.data, [1, 5, 8,
                                           3, 7, nil])
        youngTableau.insert(element: 0)
        XCTAssertEqual(youngTableau.data, [0, 1, 5,
                                           3, 7, 8])
        XCTAssertEqual(youngTableau.extractMin(), 0)

        XCTAssertEqual(youngTableau.data, [1, 5, 8,
                                           3, 7, nil])
        youngTableau.insert(element: 2)
        XCTAssertEqual(youngTableau.data, [1, 2, 5,
                                           3, 7, 8])
        XCTAssertEqual(youngTableau.extractMin(), 1)

        XCTAssertEqual(youngTableau.data, [2, 5, 8,
                                           3, 7, nil])
        youngTableau.insert(element: 6)
        XCTAssertEqual(youngTableau.data, [2, 5, 6,
                                           3, 7, 8])
        XCTAssertEqual(youngTableau.extractMin(), 2)

        XCTAssertEqual(youngTableau.data, [3, 5, 6,
                                           7, 8, nil])
        youngTableau.insert(element: 2)
        XCTAssertEqual(youngTableau.data, [2, 5, 6,
                                           3, 7, 8])
        XCTAssertEqual(youngTableau.extractMin(), 2)

        XCTAssertEqual(youngTableau.data, [3, 5, 6,
                                           7, 8, nil])
        youngTableau.insert(element: 4)
        XCTAssertEqual(youngTableau.data, [3, 5, 6,
                                           4, 7, 8])
        XCTAssertEqual(youngTableau.extractMin(), 3)

        XCTAssertEqual(youngTableau.data, [4, 5, 6,
                                           7, 8, nil])
        youngTableau.insert(element: 7.5)
        XCTAssertEqual(youngTableau.data, [4, 5, 6,
                                           7, 7.5, 8])
        XCTAssertEqual(youngTableau.extractMin(), 4)

        XCTAssertEqual(youngTableau.data, [5, 6, 8,
                                           7, 7.5, nil])
        youngTableau.insert(element: 9)
        XCTAssertEqual(youngTableau.data, [5, 6, 8,
                                           7, 7.5, 9])
        XCTAssertEqual(youngTableau.extractMin(), 5)

        XCTAssertEqual(youngTableau.data, [6, 7.5, 8,
                                           7, 9, nil])
        youngTableau.insert(element: 7.1)
    }

    func testContains() {
        let youngTableau = YoungTableau(rows: 4, columns: 4, data: [3, 4, 5, 14, 8, 9, 12, nil, 16])
        XCTAssertEqual(youngTableau.data, [3, 4, 5, 14,
                                           8, 9, 12, nil,
                                           16, nil, nil, nil,
                                           nil, nil, nil, nil])
        XCTAssertTrue(youngTableau.contains(14))
        XCTAssertFalse(youngTableau.contains(15))
        XCTAssertFalse(youngTableau.contains(20))
        XCTAssertFalse(youngTableau.contains(0))
        XCTAssertTrue(youngTableau.contains(3))
    }
}
