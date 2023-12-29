//
//  MergeSort.swift
//  Algorithms
//
//  Created by Alex Magalhaes on 09/21/20.
//  Copyright © 2020 Alex Machado. All rights reserved.
//

public final class MergeSortWithSortKeys<ElementType, ComparableType: Comparable>: SortingWithSortKeysAlgorithm {
    private var array: [ElementType]
    private var sortKeys: [ComparableType]

    public init(input: [ElementType], sortKeys: [ComparableType]) {
        array = input
        self.sortKeys = sortKeys
    }

    public func sort() -> [ElementType] {
        mergeSort(p: 0, r: array.count)
        return array
    }

    private func mergeSort(p: Int, r: Int) {
        guard p < r - 1 else { return }
        let q = (p + r) / 2
        mergeSort(p: p, r: q)
        mergeSort(p: q, r: r)
        merge(p: p, q: q, r: r)
    }

    private func merge(p: Int, q: Int, r: Int) {
        let leftSortKeys = sortKeys[p..<q]
        let rightSortKeys = sortKeys[q..<r]
        let left = array[p..<q]
        let right = array[q..<r]

        var i = p
        var j = q
        var k = p
        while i < q && j < r {
            if leftSortKeys[i] <= rightSortKeys[j] {
                array[k] = left[i]
                sortKeys[k] = leftSortKeys[i]
                i += 1
            } else {
                array[k] = right[j]
                sortKeys[k] = rightSortKeys[j]
                j += 1
            }
            k += 1
        }

        while i < q {
            array[k] = left[i]
            sortKeys[k] = leftSortKeys[i]
            i += 1
            k += 1
        }

        while j < r {
            array[k] = right[j]
            sortKeys[k] = rightSortKeys[j]
            j += 1
            k += 1
        }
    }
}
