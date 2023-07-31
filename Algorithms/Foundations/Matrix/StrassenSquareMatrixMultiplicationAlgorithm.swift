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

    public func multiplyMatrices() throws -> SquareMatrix<Number>? {
        return try squareMatrixMultiplyStrassen(a: a, b: b)
    }

    private func squareMatrixMultiplyStrassen(a: SquareMatrix<Number>, b: SquareMatrix<Number>) throws -> SquareMatrix<Number> {
        let n = a.rows
        var c = SquareMatrix<Number>(repeating: 0, rows: n)
        if n == 1 {
            c[0, 0] = a[0, 0] * b[0, 0]
            return c
        }

        let newN = n/2
        let a00 = try a.quadrant(i: 0, j: 0, n: newN)
        let a01 = try a.quadrant(i: 0, j: 1, n: newN)
        let a10 = try a.quadrant(i: 1, j: 0, n: newN)
        let a11 = try a.quadrant(i: 1, j: 1, n: newN)
        let b00 = try b.quadrant(i: 0, j: 0, n: newN)
        let b01 = try b.quadrant(i: 0, j: 1, n: newN)
        let b10 = try b.quadrant(i: 1, j: 0, n: newN)
        let b11 = try b.quadrant(i: 1, j: 1, n: newN)

        let s1 = try b01 - b11
        let s2 = try a00 + a01
        let s3 = try a10 + a11
        let s4 = try b10 - b00
        let s5 = try a00 + a11
        let s6 = try b00 + b11
        let s7 = try a01 - a11
        let s8 = try b10 + b11
        let s9 = try a00 - a10
        let s10 = try b00 + b01

        let p1 = try squareMatrixMultiplyStrassen(a: a00, b: s1)
        let p2 = try squareMatrixMultiplyStrassen(a: s2, b: b11)
        let p3 = try squareMatrixMultiplyStrassen(a: s3, b: b00)
        let p4 = try squareMatrixMultiplyStrassen(a: a11, b: s4)
        let p5 = try squareMatrixMultiplyStrassen(a: s5, b: s6)
        let p6 = try squareMatrixMultiplyStrassen(a: s7, b: s8)
        let p7 = try squareMatrixMultiplyStrassen(a: s9, b: s10)

        let c00 = try p5 + p4 - p2 + p6
        let c01 = try p1 + p2
        let c10 = try p3 + p4
        let c11 = try p5 + p1 - p3 - p7

        try c.setQuadrant(i: 0, j: 0, n: newN, matrix: c00)
        try c.setQuadrant(i: 0, j: 1, n: newN, matrix: c01)
        try c.setQuadrant(i: 1, j: 0, n: newN, matrix: c10)
        try c.setQuadrant(i: 1, j: 1, n: newN, matrix: c11)

        return c
    }
}
