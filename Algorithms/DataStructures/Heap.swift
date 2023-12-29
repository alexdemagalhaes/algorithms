//
//  Heap.swift
//  Algorithms
//
//  Created by Alex Magalhaes on 12/29/23.
//  Copyright © 2023 Alex Machado. All rights reserved.
//

import Foundation

public struct Heap<ComparableType: Comparable> {
    private var array: [ComparableType]

    public init(array: [ComparableType]) {
        self.array = array
    }

    public var heapArray: [ComparableType] {
        array
    }

    public var heapSize: Int {
        array.count
    }

    /// Assumes the binary trees rooted at left and right are max-heaps,
    /// but array[i] might be smaller than its children
    public mutating func maxHeapify(i: Int = 0) {
        let right = 2 * (i + 1)
        let left = right - 1

        var largest: Int
        if left < heapSize, array[left] > array[i] {
            largest = left
        } else {
            largest = i
        }
        if right < heapSize, array[right] > array[largest] {
            largest = right
        }

        if largest != i {
            array.swapAt(i, largest)
            maxHeapify(i: largest)
        }
    }

    /// Assumes the binary trees rooted at left and right are min-heaps,
    /// but array[i] might be greater than its children
    public mutating func minHeapify(i: Int = 0) {
        let right = 2 * (i + 1)
        let left = right - 1

        var smallest: Int
        if left < heapSize, array[left] < array[i] {
            smallest = left
        } else {
            smallest = i
        }
        if right < heapSize, array[right] < array[smallest] {
            smallest = right
        }

        if smallest != i {
            array.swapAt(i, smallest)
            minHeapify(i: smallest)
        }
    }

    /// Assumes the binary trees rooted at left and right are max-heaps,
    /// but array[i] might be smaller than its children
    public mutating func maxHeapifyNonRecursive(i initialIndex: Int = 0) {
        var i = initialIndex
        while true {
            let right = 2 * (i + 1)
            let left = right - 1

            var largest: Int
            if left < heapSize, array[left] > array[i] {
                largest = left
            } else {
                largest = i
            }
            if right < heapSize, array[right] > array[largest] {
                largest = right
            }

            if largest == i {
                return
            }
            array.swapAt(i, largest)
            i = largest
        }
    }
}
