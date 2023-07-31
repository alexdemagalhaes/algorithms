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
            (AnyMatrixMultiplicationAlgorithm(CubicTimeSquareMatrixMultiplicationAlgorithm(a: a, b: b)), expectedOutput),
            (AnyMatrixMultiplicationAlgorithm(DivideAndConquerSquareMatrixMultiplicationAlgorithm(a: a, b: b)), expectedOutput),
            (AnyMatrixMultiplicationAlgorithm(StrassenSquareMatrixMultiplicationAlgorithm(a: a, b: b)), expectedOutput)
        ]
        do {
            try algorithms.forEach { (algorithm, expectedOutput) in
                XCTAssertEqual(try algorithm.multiplyMatrices(), expectedOutput)
            }
        } catch {
            XCTFail(error.localizedDescription)
        }
    }

    func testMultiplicationOf2x2Matrix() throws {
        let a = try SquareMatrix(data: [1, 3,
                                        7, 5])
        let b = try SquareMatrix(data: [6, 8,
                                        4, 2])
        let c = try SquareMatrix(data: [18, 14,
                                        62, 66])
        testSquareMatrixMultiplicationAlgorithms(a: a, b: b, expectedOutput: c)
    }

    func testMultiplicationOf4x4Matrix() throws {
        let a = try SquareMatrix(data: [5, 7, 9, 10,
                                        2, 3, 3, 8,
                                        8, 10, 2, 3,
                                        3, 3, 4, 8])
        let b = try SquareMatrix(data: [3, 10, 12, 18,
                                        12, 1, 4, 9,
                                        9, 10, 12, 2,
                                        3, 12, 4, 10])
        let c = try SquareMatrix(data: [210, 267, 236, 271,
                                        93, 149, 104, 149,
                                        171, 146, 172, 268,
                                        105, 169, 128, 169])
        testSquareMatrixMultiplicationAlgorithms(a: a, b: b, expectedOutput: c)
    }
}
