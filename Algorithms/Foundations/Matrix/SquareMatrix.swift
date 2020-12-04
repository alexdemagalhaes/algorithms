//
//  SquareMatrix.swift
//  Algorithms
//
//  Created by Alex Magalhaes on 11/20/20.
//  Copyright © 2020 Alex Machado. All rights reserved.
//

public struct SquareMatrix<Number: SignedNumeric & Comparable>: Equatable {
    let rows: Int
    private var data: [Number]

    init(repeating number: Number = 0, rows: Int) {
        self.rows = rows
        data = [Number](repeating: number, count: rows * rows)
    }

    init?(rows: Int, data: [Number]) {
        guard rows > 0 && data.count == rows * rows else {
            return nil
        }

        self.rows = rows
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

    private func indexIsValid(row: Int, column: Int) -> Bool {
        return row >= 0 && row < rows && column >= 0 && column < rows
    }
}
