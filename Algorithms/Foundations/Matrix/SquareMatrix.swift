//
//  SquareMatrix.swift
//  Algorithms
//
//  Created by Alex Magalhaes on 11/20/20.
//  Copyright © 2020 Alex Machado. All rights reserved.
//

import Foundation

public struct SquareMatrix<Number: SignedNumeric & Comparable>: Equatable {
    enum Error: Swift.Error {
        case emptyDataArray
        case matrixNotSquare
        case indicesNotValid(row: Int, column: Int, matrixRows: Int)
        case submatrixNotValid(row: Int, column: Int, submatrixRows: Int, matrixRows: Int)
        case dimensionMismatch
    }

    let rows: Int
    private var data: [Number]

    init(repeating number: Number = 0, rows: Int) {
        self.rows = rows
        data = [Number](repeating: number, count: rows * rows)
    }

    init(data: [Number]) throws {
        guard data.count > 0 else {
            throw Error.emptyDataArray
        }

        let rows = sqrt(Double(data.count))
        guard rows == floor(rows) else {
            throw Error.matrixNotSquare
        }

        self.rows = Int(rows)
        self.data = data
    }

    subscript(row: Int, column: Int) -> Number {
        get {
            return data[(row * rows) + column]
        }
        set {
            data[(row * rows) + column] = newValue
        }
    }

    func at(row: Int, column: Int) throws -> Number {
        try validateIndices(row: row, column: column)
        return self[row, column]
    }

    mutating func setAt(row: Int, column: Int, value: Number) throws {
        try validateIndices(row: row, column: column)
        self[row, column] = value
    }

    static func +(lhs: SquareMatrix<Number>, rhs: SquareMatrix<Number>) throws -> SquareMatrix<Number> {
        guard lhs.rows == rhs.rows else {
            throw Error.dimensionMismatch
        }
        let data = lhs.data.enumerated().map { index, element in element + rhs.data[index] }
        return try SquareMatrix(data: data)
    }

    static func -(lhs: SquareMatrix<Number>, rhs: SquareMatrix<Number>) throws -> SquareMatrix<Number> {
        guard lhs.rows == rhs.rows else {
            throw Error.dimensionMismatch
        }
        let data = lhs.data.enumerated().map { index, element in element - rhs.data[index] }
        return try SquareMatrix(data: data)
    }

    func quadrant(i: Int, j: Int, n: Int) throws -> SquareMatrix<Number> {
        try validateSubmatrix(row: i, column: j, rows: n)
        var data = [Number]()
        for k in 0..<n {
            let firstIndex = (((i * n) + k) * self.rows) + (j * n)
            data.append(contentsOf: self.data.suffix(from: firstIndex).prefix(n))
        }
        return try SquareMatrix(data: data)
    }

    mutating func setQuadrant(i: Int, j: Int, n: Int, matrix: SquareMatrix<Number>) throws {
        try validateSubmatrix(row: i, column: j, rows: n)
        for k in 0..<n {
            let rowIndex = (i * n) + k
            for l in 0..<n {
                let columnIndex = (j * n) + l
                self[rowIndex, columnIndex] = matrix[k, l]
            }
        }
    }

    private func validateIndices(row: Int, column: Int) throws {
        guard row >= 0 && row < rows && column >= 0 && column < rows else {
            throw Error.indicesNotValid(row: row, column: column, matrixRows: rows)
        }
    }

    private func validateSubmatrix(row: Int, column: Int, rows: Int) throws {
        guard row * rows >= 0 && row * rows < self.rows &&
                column * rows >= 0 && column * rows < self.rows else {
            throw Error.submatrixNotValid(row: row, column: column, submatrixRows: rows, matrixRows: self.rows)
        }
    }
}
