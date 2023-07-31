//
//  DivideAndConquerSquareMatrixMultiplicationAlgorithm.swift
//  Algorithms
//
//  Created by Alex Magalhaes on 7/28/23.
//  Copyright © 2023 Alex Machado. All rights reserved.
//

public class DivideAndConquerSquareMatrixMultiplicationAlgorithm<Number: SignedNumeric & Comparable>: SquareMatrixMultiplicationAlgorithm {
    private let a: SquareMatrix<Number>
    private let b: SquareMatrix<Number>

    init(a: SquareMatrix<Number>, b: SquareMatrix<Number>) {
        self.a = a
        self.b = b
    }

    public func multiplyMatrices() throws -> SquareMatrix<Number>? {
        return try squareMatrixMultiplyRecursive(a: a, b: b)
    }

    private func squareMatrixMultiplyRecursive(a: SquareMatrix<Number>, b: SquareMatrix<Number>) throws -> SquareMatrix<Number> {
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

        let c00 = try squareMatrixMultiplyRecursive(a: a00, b: b00) + squareMatrixMultiplyRecursive(a: a01, b: b10)
        let c01 = try squareMatrixMultiplyRecursive(a: a00, b: b01) + squareMatrixMultiplyRecursive(a: a01, b: b11)
        let c10 = try squareMatrixMultiplyRecursive(a: a10, b: b00) + squareMatrixMultiplyRecursive(a: a11, b: b10)
        let c11 = try squareMatrixMultiplyRecursive(a: a10, b: b01) + squareMatrixMultiplyRecursive(a: a11, b: b11)

        try c.setQuadrant(i: 0, j: 0, n: newN, matrix: c00)
        try c.setQuadrant(i: 0, j: 1, n: newN, matrix: c01)
        try c.setQuadrant(i: 1, j: 0, n: newN, matrix: c10)
        try c.setQuadrant(i: 1, j: 1, n: newN, matrix: c11)

        return c
    }
}
