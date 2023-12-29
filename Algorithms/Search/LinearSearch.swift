//
//  LinearSearch.swift
//  Algorithms
//
//  Created by Alex Magalhaes on 09/23/20.
//  Copyright © 2020 Alex Machado. All rights reserved.
//

public class LinearSearch<ComparableType: Comparable>: SearchAlgorithm {
    private let array: [ComparableType]

    required public init(input: [ComparableType]) {
        array = input
    }

    public func search(for value: ComparableType) -> Int? {
        for i in 0..<array.count {
            if value == array[i] {
                return i
            }
        }
        return nil
    }
}
