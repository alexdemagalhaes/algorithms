//
//  BinarySearch.swift
//  Algorithms
//
//  Created by Alex Magalhaes on 09/23/20.
//  Copyright © 2020 Alex Machado. All rights reserved.
//

public class BinarySearch<ComparableType: Comparable>: SearchAlgorithm {
    private let array: [ComparableType]

    required public init(input: [ComparableType]) {
        array = input
    }

    public func search(for value: ComparableType) -> Int? {
        return search(for: value, p: 0, r: array.count)
    }

    public func search(for value: ComparableType, p: Int, r: Int) -> Int? {
        guard p < r - 1 else {
            if p >= 0 && p < array.count && array[p] == value {
                return p
            }
            return nil
        }

        let q = (p + r) / 2
        switch value {
        case let v where v < array[q]:
            return search(for: value, p: p, r: q)
        case let v where v > array[q]:
            return search(for: value, p: q + 1, r: r)
        default:
            return q
        }
    }
}
