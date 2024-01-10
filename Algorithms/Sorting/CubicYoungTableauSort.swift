//
//  CubicYoungTableauSort.swift
//  Algorithms
//
//  Created by Alex Magalhaes on 1/10/24.
//  Copyright © 2024 Alex Machado. All rights reserved.
//

public final class CubicYoungTableauSort<ComparableType: Comparable>: SortingAlgorithm {
    private var input: [ComparableType]

    public init(input: [ComparableType]) {
        precondition(input.count > 0)
        self.input = input
    }

    public func sort() -> [ComparableType] {
        let doubleRows = Double(input.count).squareRoot()
        let rows = Int(doubleRows)
        precondition(rows * rows == input.count)
        var youngTableau = YoungTableau(rows: rows, columns: rows, data: [ComparableType]())

        for i in 0..<input.count {
            youngTableau.insert(element: input[i])
        }

        for i in 0..<input.count {
            let min = youngTableau.extractMin()
            precondition(min != nil)
            input[i] = min!
        }
        return input
    }
}
