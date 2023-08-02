//
//  StrassenSquareMatrixMultiplicationAlgorithm.swift
//  Algorithms
//
//  Created by Alex Magalhaes on 7/31/23.
//  Copyright © 2023 Alex Machado. All rights reserved.
//

import Foundation

public class StrassenSquareMatrixMultiplicationAlgorithm<Number: SignedNumeric & Comparable>: SquareMatrixMultiplicationAlgorithm {
    private let a: SquareMatrix<Number>
    private let b: SquareMatrix<Number>

    init(a: SquareMatrix<Number>, b: SquareMatrix<Number>) {
        self.a = a
        self.b = b
    }

    public func multiplyMatrices() -> SquareMatrix<Number>? {
        return squareMatrixMultiplyStrassen(a: a, b: b)
    }

    private func squareMatrixMultiplyStrassen(a: SquareMatrix<Number>, b: SquareMatrix<Number>) -> SquareMatrix<Number> {
        let n = a.rows
        var c = SquareMatrix<Number>(repeating: 0, rows: n)
        if n == 1 {
            c[0, 0] = a[0, 0] * b[0, 0]
            return c
        }

        let newN = n/2
        let a00 = a.quadrant(i: 0, j: 0, n: newN)
        let a01 = a.quadrant(i: 0, j: 1, n: newN)
        let a10 = a.quadrant(i: 1, j: 0, n: newN)
        let a11 = a.quadrant(i: 1, j: 1, n: newN)
        let b00 = b.quadrant(i: 0, j: 0, n: newN)
        let b01 = b.quadrant(i: 0, j: 1, n: newN)
        let b10 = b.quadrant(i: 1, j: 0, n: newN)
        let b11 = b.quadrant(i: 1, j: 1, n: newN)

        let s1 = b01 - b11
        let s2 = a00 + a01
        let s3 = a10 + a11
        let s4 = b10 - b00
        let s5 = a00 + a11
        let s6 = b00 + b11
        let s7 = a01 - a11
        let s8 = b10 + b11
        let s9 = a00 - a10
        let s10 = b00 + b01

        let p1 = squareMatrixMultiplyStrassen(a: a00, b: s1)
        let p2 = squareMatrixMultiplyStrassen(a: s2, b: b11)
        let p3 = squareMatrixMultiplyStrassen(a: s3, b: b00)
        let p4 = squareMatrixMultiplyStrassen(a: a11, b: s4)
        let p5 = squareMatrixMultiplyStrassen(a: s5, b: s6)
        let p6 = squareMatrixMultiplyStrassen(a: s7, b: s8)
        let p7 = squareMatrixMultiplyStrassen(a: s9, b: s10)

        let c00 = p5 + p4 - p2 + p6
        let c01 = p1 + p2
        let c10 = p3 + p4
        let c11 = p5 + p1 - p3 - p7

        c.setQuadrant(i: 0, j: 0, n: newN, matrix: c00)
        c.setQuadrant(i: 0, j: 1, n: newN, matrix: c01)
        c.setQuadrant(i: 1, j: 0, n: newN, matrix: c10)
        c.setQuadrant(i: 1, j: 1, n: newN, matrix: c11)

        return c
    }
}
