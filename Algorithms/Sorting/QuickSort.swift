//
//  QuickSort.swift
//  Algorithms
//
//  Created by Alex Magalhaes on 2/1/24.
//  Copyright © 2024 Alex Machado. All rights reserved.
//

public final class QuickSort<ComparableType: Comparable>: SortingAlgorithm {
    private var array: [ComparableType]

    public init(input: [ComparableType]) {
        array = input
    }

    public func sort() -> [ComparableType] {
        quickSort(p: 0, r: array.count - 1)
        return array
    }

    private func quickSort(p: Int, r: Int) {
        guard p < r else { return }
        let q = partition(p: p, r: r)
        quickSort(p: p, r: q - 1)
        quickSort(p: q + 1, r: r)
    }

    private func partition(p: Int, r: Int) -> Int {
        let x = array[r]
        var i = p-1
        for j in p..<r {
            if array[j] <= x {
                i += 1
                array.swapAt(i, j)
            }
        }
        array.swapAt(i+1, r)
        return i+1
    }
}
