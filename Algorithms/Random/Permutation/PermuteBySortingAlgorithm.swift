//
//  PermuteBySortingAlgorithm.swift
//  Algorithms
//
//  Created by Alex Magalhaes on 12/20/23.
//  Copyright © 2023 Alex Machado. All rights reserved.
//

import Foundation

public final class PermuteBySortingAlgorithm<ElementType>: RandomPermutationAlgorithm {
    private var array: [ElementType]
    var priorities: [Int]

    public init(input: [ElementType]) {
        array = input
        priorities = [Int](repeating: 0, count: input.count)
    }

    public func permute() -> [ElementType] {
        let n = array.count
        for i in 0..<n {
            priorities[i] = newUniquePriority()
        }
        let mergeSort = MergeSortWithSortKeys(input: array, sortKeys: priorities)
        return mergeSort.sort()
    }

    private func newUniquePriority() -> Int {
        let priority = Int.random(in: 1...Int(pow(Double(array.count), Double(3))))
        if !priorities.contains(priority) {
            return priority
        } else {
            return newUniquePriority()
        }
    }
}
