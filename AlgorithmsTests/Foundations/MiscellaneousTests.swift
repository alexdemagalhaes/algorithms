//
//  MiscellaneousTests.swift
//  AlgorithmsTests
//
//  Created by Alex Magalhaes on 09/29/20.
//  Copyright © 2020 Alex Machado. All rights reserved.
//

@testable import Algorithms
import XCTest

final class MiscellaneousTests: XCTestCase {
    private var algorithms: MiscellaneousAlgorithms!

    override func setUp() {
        super.setUp()
        algorithms = MiscellaneousAlgorithms()
    }

    override func tearDown() {
        algorithms = nil
        super.tearDown()
    }

    func testCheckIfArrayFindsMatchCorrectlyBetweenSmallestNumbers() {
        XCTAssertTrue(algorithms.checkIfArray([5, 2, 4, 6, 1, 3], containsTwoElementsWhoseSumIs: 4))
    }

    func testCheckIfArrayFindsMatchCorrectlyBetweenGreatestNumbers() {
        XCTAssertTrue(algorithms.checkIfArray([5, 2, 4, 6, 1, 3], containsTwoElementsWhoseSumIs: 11))
    }

    func testCheckIfArrayWithNegativeNumbersFindsMatchCorrectlyBetweenSmallestNumbers() {
        XCTAssertTrue(algorithms.checkIfArray([7, 2, -5, 0, 10], containsTwoElementsWhoseSumIs: -5))
    }

    func testCheckIfArrayWithNegativeNumbersFindsMatchCorrectlyBetweenGreatestNumbers() {
        XCTAssertTrue(algorithms.checkIfArray([7, 2, -5, 0, 10], containsTwoElementsWhoseSumIs: 9))
    }

    func testCheckIfArrayWithAThousandElementsFindsMatchCorrectly() {
        XCTAssertTrue(algorithms.checkIfArray(Numbers.thousandRandomNumbers, containsTwoElementsWhoseSumIs: 414812))
    }

    func testCheckIfArrayDoesNotFindMatchSmallerThanSmallestSum() {
        XCTAssertFalse(algorithms.checkIfArray([5, 2, 4, 6, 1, 3], containsTwoElementsWhoseSumIs: 1))
    }

    func testCheckIfArrayDoesNotFindMatchGreaterThanGreatestSum() {
        XCTAssertFalse(algorithms.checkIfArray([5, 2, 4, 6, 1, 3], containsTwoElementsWhoseSumIs: 12))
    }

    func testCheckIfArrayWithNegativeNumbersDoesNotFindMatchBetweenGreatestNumbers() {
        XCTAssertFalse(algorithms.checkIfArray([7, 2, -5, 0, 10], containsTwoElementsWhoseSumIs: 6))
    }

    func testCheckIfArrayWithNegativeNumbersDoesNotFindMatchGreaterThanGreatestSum() {
        XCTAssertFalse(algorithms.checkIfArray([7, 2, -5, 0, 10], containsTwoElementsWhoseSumIs: 18))
    }

    func testCheckIfArrayWithAThousandElementsDoesNotFindMatch() {
        XCTAssertFalse(algorithms.checkIfArray(Numbers.thousandRandomNumbers,containsTwoElementsWhoseSumIs: 481516))
    }
}
