//
//  SelectionSort.swift
//  Algorithms
//
//  Created by Alex Magalhaes on 08/27/20.
//  Copyright © 2020 Alex Machado. All rights reserved.
//

public final class SelectionSort<ComparableType: Comparable>: SortingAlgorithm {
    private var array: [ComparableType]

    init(input: [ComparableType]) {
        array = input
    }

    public func sort() -> [ComparableType] {
        var j = 0
        while j < array.count-1 {
            var smallest = j
            var i = j + 1
            while i < array.count {
                if array[i] < array[smallest] {
                    smallest = i
                }
                i = i + 1
            }
            array.swapAt(j, smallest)
            j = j + 1
        }
        return array
    }
}
