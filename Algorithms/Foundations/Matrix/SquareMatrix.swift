//
//  SquareMatrix.swift
//  Algorithms
//
//  Created by Alex Magalhaes on 11/20/20.
//  Copyright © 2020 Alex Machado. All rights reserved.
//

import Foundation

public struct SquareMatrix<Number: SignedNumeric & Comparable>: Equatable {
    let rows: Int
    private var data: [Number]

    init(repeating number: Number = 0, rows: Int) {
        self.rows = rows
        data = [Number](repeating: number, count: rows * rows)
    }

    init?(data: [Number]) {
        guard data.count > 0 else {
            return nil
        }

        let rows = sqrt(Double(data.count))
        guard rows == floor(rows) else {
            return nil
        }

        self.rows = Int(rows)
        self.data = data
    }

    subscript(row: Int, column: Int) -> Number {
        get {
            assert(indexIsValid(row: row, column: column), "Index out of range")
            return data[(row * rows) + column]
        }
        set {
            assert(indexIsValid(row: row, column: column), "Index out of range")
            data[(row * rows) + column] = newValue
        }
    }

    static func +(lhs: SquareMatrix<Number>, rhs: SquareMatrix<Number>) -> SquareMatrix<Number> {
        assert(lhs.rows == rhs.rows)
        let data = lhs.data.enumerated().map { index, element in element + rhs.data[index] }
        return SquareMatrix(data: data)!
    }

    func quadrant(i: Int, j: Int, n: Int) -> SquareMatrix<Number> {
        assert(submatrixIsValid(row: i, column: j, rows: n), "Submatrix out of range")
        var data = [Number]()
        for k in 0..<n {
            let firstIndex = (((i * n) + k) * self.rows) + (j * n)
            data.append(contentsOf: self.data.suffix(from: firstIndex).prefix(n))
        }
        return SquareMatrix(data: data)!
    }

    mutating func setQuadrant(i: Int, j: Int, n: Int, matrix: SquareMatrix<Number>) {
        assert(submatrixIsValid(row: i, column: j, rows: n), "Submatrix out of range")
        for k in 0..<n {
            let rowIndex = (i * n) + k
            for l in 0..<n {
                let columnIndex = (j * n) + l
                self[rowIndex, columnIndex] = matrix[k, l]
            }
        }
    }

    private func indexIsValid(row: Int, column: Int) -> Bool {
        return row >= 0 && row < rows && column >= 0 && column < rows
    }

    private func submatrixIsValid(row: Int, column: Int, rows: Int) -> Bool {
        return row * rows >= 0 && row * rows < self.rows && column * rows >= 0 && column * rows < self.rows
    }
}
