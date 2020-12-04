//
//  SquareMatrixMultiplicationAlgorithmTests.swift
//  AlgorithmsTests
//
//  Created by Alex Magalhaes on 12/04/20.
//  Copyright © 2020 Alex Machado. All rights reserved.
//

@testable import Algorithms
import XCTest

final class SquareMatrixMultiplicationAlgorithmTests: XCTestCase {
    private func testSquareMatrixMultiplicationAlgorithms<Number: SignedNumeric & Comparable>(
        a: SquareMatrix<Number>,
        b: SquareMatrix<Number>,
        expectedOutput: SquareMatrix<Number>?
    ) {
        let algorithms: [(AnyMatrixMultiplicationAlgorithm<Number>, SquareMatrix<Number>?)] = [
            (AnyMatrixMultiplicationAlgorithm(CubicTimeSquareMatrixMultiplicationAlgorithm(a: a, b: b)), expectedOutput)
        ]
        algorithms.forEach { (algorithm, expectedOutput) in
            XCTAssertEqual(algorithm.multiplyMatrices(), expectedOutput)
        }
    }

    func testMultiplicationOf2x2Matrix() {
        let a = SquareMatrix(rows: 2, data: [1, 3, 7, 5])!
        let b = SquareMatrix(rows: 2, data: [6, 8, 4, 2])!
        let c = SquareMatrix(rows: 2, data: [18, 14, 62, 66])!
        testSquareMatrixMultiplicationAlgorithms(a: a, b: b, expectedOutput: c)
    }
}
