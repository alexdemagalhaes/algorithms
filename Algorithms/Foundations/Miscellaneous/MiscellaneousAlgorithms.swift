//
//  MiscellaneousAlgorithms.swift
//  Algorithms
//
//  Created by Alex Magalhaes on 09/29/20.
//  Copyright © 2020 Alex Machado. All rights reserved.
//

public final class MiscellaneousAlgorithms {

    public func checkIfArray<Number: AdditiveArithmetic & Comparable>(_ array: [Number], containsTwoElementsWhoseSumIs x: Number) -> Bool {
        let mergeSort = MergeSort(input: array)
        let sortedArray = mergeSort.sort()
        var i = 0
        var j = sortedArray.count - 1
        while i < j {
            switch sortedArray[i] + sortedArray[j] {
            case let sum where sum == x:
                return true
            case let sum where sum < x:
                i += 1
            case let sum where sum > x:
                j -= 1
            default: break
            }
        }
        return false
    }

}
