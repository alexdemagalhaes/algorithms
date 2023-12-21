//
//  InsertionSort.swift
//  Algorithms
//
//  Created by Alex Magalhaes on 08/26/20.
//  Copyright © 2020 Alex Machado. All rights reserved.
//

public final class InsertionSort<ComparableType: Comparable>: SortingAlgorithm {
    private var array: [ComparableType]

    public init(input: [ComparableType]) {
        array = input
    }

    public func sort() -> [ComparableType] {
        var j = 1
        while j < array.count {
            let key = array[j]

            // Insert array[j] into the sorted sequence array[0...j-1]
            var i = j - 1
            while i >= 0 && array[i] > key {
                array[i + 1] = array[i]
                i = i - 1
            }
            array[i + 1] = key

            j = j + 1
        }
        return array
    }
}
