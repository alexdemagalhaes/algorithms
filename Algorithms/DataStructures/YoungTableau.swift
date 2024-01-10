//
//  YoungTableau.swift
//  Algorithms
//
//  Created by Alex Magalhaes on 1/8/24.
//  Copyright © 2024 Alex Machado. All rights reserved.
//

import Foundation

extension Optional: Comparable where Wrapped: Comparable {
    public static func < (lhs: Optional<Wrapped>, rhs: Optional<Wrapped>) -> Bool {
        switch (lhs, rhs) {
        case let (l?, r?):
            return l < r
        case (_?, nil):
            return true
        default:
            return false
        }
    }
}

public struct YoungTableau<Element: Comparable> {
    let rows: Int
    let columns: Int
    var data: [Element?]

    init(rows: Int, columns: Int, data: [Element?]) {
        self.rows = rows
        self.columns = columns
        self.data = data
        let missingElements = rows * columns - data.count
        self.data.append(contentsOf: [Element?](repeating: nil, count: missingElements))
    }

    public mutating func insert(element: Element?) {
        var i = rows - 1
        var j = columns - 1
        var index = i * columns + j
        data[index] = element

        var previousRow = i - 1
        var previousColumn = j - 1
        var previousRowIndex = previousRow * columns + j
        var previousColumnIndex = i * columns + previousColumn
        while (previousRow >= 0 && data[previousRowIndex] > data[index])
                || (previousColumn >= 0 && data[previousColumnIndex] > data[index]) {

            if previousRow < 0 {
                data.swapAt(index, previousColumnIndex)

                j -= 1
                previousColumn = j - 1
            } else if previousColumn < 0 {
                data.swapAt(index, previousRowIndex)

                i -= 1
                previousRow = i - 1
            } else if data[previousRowIndex] < data[previousColumnIndex] {
                data.swapAt(index, previousColumnIndex)

                j -= 1
                previousColumn = j - 1
            } else {
                data.swapAt(index, previousRowIndex)

                i -= 1
                previousRow = i - 1
            }

            index = i * columns + j
            previousRowIndex = previousRow * columns + j
            previousColumnIndex = i * columns + previousColumn
        }
    }

    public mutating func extractMin() -> Element? {
        extractMin(i: 0, j: 0)
    }

    private mutating func extractMin(i: Int, j: Int) -> Element? {
        let index = i * columns + j
        let min = data[index]
        let nextRow = i + 1
        let nextColumn = j + 1

        if nextColumn < columns {
            let nextColumnIndex = i * columns + nextColumn

            if nextRow < rows {
                let nextRowIndex = nextRow * columns + j

                if data[nextColumnIndex] == nil, data[nextRowIndex] == nil {
                    data[index] = nil
                    return min
                }

                if data[nextColumnIndex] < data[nextRowIndex] {
                    data.swapAt(index, nextColumnIndex)
                    return extractMin(i: i, j: nextColumn)
                } else {
                    data.swapAt(index, nextRowIndex)
                    return extractMin(i: nextRow, j: j)
                }
            } else {
                if data[nextColumnIndex] == nil {
                    data[index] = nil
                    return min
                }

                data.swapAt(index, nextColumnIndex)
                return extractMin(i: i, j: nextColumn)
            }
        } else {
            if nextRow < rows {
                let nextRowIndex = nextRow * columns + j

                if data[nextRowIndex] == nil {
                    data[index] = nil
                    return min
                }

                data.swapAt(index, nextRowIndex)
                return extractMin(i: nextRow, j: j)
            } else {
                data[index] = nil
                return min
            }
        }
    }

    public func contains(_ element: Element) -> Bool {
        var i = rows - 1
        var j = 0
        while i >= 0 && j < columns {
            let index = i * columns + j
            if data[index] == element {
                return true
            }
            if data[index] == nil || data[index] > element {
                i -= 1
            } else {
                j += 1
            }
         }
        return false
    }
}
