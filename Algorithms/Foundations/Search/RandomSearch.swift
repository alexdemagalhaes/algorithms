//
//  RandomSearch.swift
//  Algorithms
//
//  Created by Alex Magalhaes on 12/27/23.
//  Copyright © 2023 Alex Machado. All rights reserved.
//

import Foundation

public class RandomSearch<ComparableType: Comparable>: SearchAlgorithm {
    private let array: [ComparableType]

    required public init(input: [ComparableType]) {
        array = input
    }

    public func search(for value: ComparableType) -> Int? {
        let n = array.count
        var visitedIndices = Array(repeating: 0, count: n)
        var counter = 0
        while counter < n {
            let i = Int.random(in: 0..<n)
            if array[i] == value {
                return i
            }
            if visitedIndices[i] == 0 {
                visitedIndices[i] = 1
                counter += 1
            }
        }
        return nil
    }
}
