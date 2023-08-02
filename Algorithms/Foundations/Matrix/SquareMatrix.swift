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

        var message: String {
            switch self {
            case .emptyDataArray:
                return "Data array cannot be empty"
            case .matrixNotSquare:
                return "Matrix must be square"
            case .indicesNotValid(let row, let column, let matrixRows):
                return "\(row) and \(column) must both be >= 0 and < \(matrixRows)"
            case .submatrixNotValid(let row, let column, let submatrixRows, let matrixRows):
                return "\(row * submatrixRows) and \(column * submatrixRows) must both be >= 0 and < \(matrixRows)"
            case .dimensionMismatch:
                return "Matrices must have same dimensions"
            }
        }
    }

    let rows: Int
    private var data: [Number]

    init(repeating number: Number = 0, rows: Int) {
        self.rows = rows
        data = [Number](repeating: number, count: rows * rows)
    }

    init(data: [Number]) {
        guard data.count > 0 else {
            fatalError(Error.emptyDataArray.message)
        }

        let rows = sqrt(Double(data.count))
        guard rows == floor(rows) else {
            fatalError(Error.matrixNotSquare.message)
        }

        self.rows = Int(rows)
        self.data = data
    }

    subscript(row: Int, column: Int) -> Number {
        get {
            validateIndices(row: row, column: column)
            return data[(row * rows) + column]
        }
        set {
            validateIndices(row: row, column: column)
            data[(row * rows) + column] = newValue
        }
    }

    static func +(lhs: SquareMatrix<Number>, rhs: SquareMatrix<Number>) -> SquareMatrix<Number> {
        guard lhs.rows == rhs.rows else {
            fatalError(Error.dimensionMismatch.message)
        }
        let data = lhs.data.enumerated().map { index, element in element + rhs.data[index] }
        return SquareMatrix(data: data)
    }

    static func -(lhs: SquareMatrix<Number>, rhs: SquareMatrix<Number>) -> SquareMatrix<Number> {
        guard lhs.rows == rhs.rows else {
            fatalError(Error.dimensionMismatch.message)
        }
        let data = lhs.data.enumerated().map { index, element in element - rhs.data[index] }
        return SquareMatrix(data: data)
    }

    func quadrant(i: Int, j: Int, n: Int) -> SquareMatrix<Number> {
        validateSubmatrix(row: i, column: j, rows: n)
        var data = [Number]()
        for k in 0..<n {
            let firstIndex = (((i * n) + k) * self.rows) + (j * n)
            data.append(contentsOf: self.data.suffix(from: firstIndex).prefix(n))
        }
        return SquareMatrix(data: data)
    }

    mutating func setQuadrant(i: Int, j: Int, n: Int, matrix: SquareMatrix<Number>) {
        validateSubmatrix(row: i, column: j, rows: n)
        for k in 0..<n {
            let rowIndex = (i * n) + k
            for l in 0..<n {
                let columnIndex = (j * n) + l
                self[rowIndex, columnIndex] = matrix[k, l]
            }
        }
    }

    private func validateIndices(row: Int, column: Int) {
        guard row >= 0 && row < rows && column >= 0 && column < rows else {
            fatalError(Error.indicesNotValid(row: row, column: column, matrixRows: rows).message)
        }
    }

    private func validateSubmatrix(row: Int, column: Int, rows: Int) {
        guard row * rows >= 0 && row * rows < self.rows &&
                column * rows >= 0 && column * rows < self.rows else {
            fatalError(Error.submatrixNotValid(row: row, column: column, submatrixRows: rows, matrixRows: self.rows).message)
        }
    }
}
