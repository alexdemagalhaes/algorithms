//
//  BubbleSort.swift
//  Algorithms
//
//  Created by Alex Magalhaes on 09/29/20.
//  Copyright © 2020 Alex Machado. All rights reserved.
//

public final class BubbleSort<ComparableType: Comparable>: SortingAlgorithm {
    private var array: [ComparableType]

    init(input: [ComparableType]) {
        array = input
    }

    public func sort() -> [ComparableType] {
        guard !array.isEmpty else { return array }
        let lastIndex = array.count-1
        for i in 0..<lastIndex {
            for j in stride(from: lastIndex, to: i, by: -1) {
                if array[j] < array[j-1] {
                    array.swapAt(j, j-1)
                }
            }
        }
        return array
    }
}
