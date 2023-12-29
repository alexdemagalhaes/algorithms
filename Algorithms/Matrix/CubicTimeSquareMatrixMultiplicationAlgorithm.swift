//
//  CubicTimeSquareMatrixMultiplicationAlgorithm.swift
//  Algorithms
//
//  Created by Alex Magalhaes on 12/04/20.
//  Copyright © 2020 Alex Machado. All rights reserved.
//

public class CubicTimeSquareMatrixMultiplicationAlgorithm<Number: SignedNumeric & Comparable>: SquareMatrixMultiplicationAlgorithm {
    private let a: SquareMatrix<Number>
    private let b: SquareMatrix<Number>

    init(a: SquareMatrix<Number>, b: SquareMatrix<Number>) {
        self.a = a
        self.b = b
    }

    public func multiplyMatrices() -> SquareMatrix<Number>? {
        let n = a.rows
        var c = SquareMatrix<Number>(repeating: 0, rows: n)
        for i in 0..<n {
            for j in 0..<n {
                for k in 0..<n {
                    c[i, j] += a[i, k] * b[k, j]
                }
            }
        }
        return c
    }
}
