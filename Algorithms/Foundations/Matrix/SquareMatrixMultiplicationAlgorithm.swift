//
//  SquareMatrixMultiplicationAlgorithm.swift
//  Algorithms
//
//  Created by Alex Magalhaes on 11/20/20.
//  Copyright © 2020 Alex Machado. All rights reserved.
//

public protocol SquareMatrixMultiplicationAlgorithm {
    associatedtype Number: SignedNumeric & Comparable

    func multiplyMatrices() -> SquareMatrix<Number>?
}

struct AnyMatrixMultiplicationAlgorithm<Number: SignedNumeric & Comparable> {
    private let multiplyMatricesMethod: () -> SquareMatrix<Number>?

    init<Algorithm: SquareMatrixMultiplicationAlgorithm>(_ algorithm: Algorithm) where Algorithm.Number == Number {
        self.multiplyMatricesMethod = algorithm.multiplyMatrices
    }

    func multiplyMatrices() -> SquareMatrix<Number>? {
        return multiplyMatricesMethod()
    }
}
