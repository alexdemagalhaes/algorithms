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

    public init(input: any Sequence<ComparableType>) {
        array = Array(input)
        heapSize = array.count
    }

    public var heapSize: Int

    public var length: Int {
        array.count
    }

    public var heapArray: [ComparableType] {
        array
    }

    /// Assumes heapSize is less than or equal to length
    public var heapElements: ArraySlice<ComparableType> {
        array[0..<heapSize]
    }

    /// Assumes the heap is a max-heap and it's not empty
    public var maximum: ComparableType {
        array[0]
    }

    /// Assumes the heap is a min-heap and it's not empty
    public var minimum: ComparableType {
        array[0]
    }

    // Assumes i is not the root
    private func parent(i: Int) -> Int {
        (i - 1) / 2
    }

    /// Assumes the heap is a max-heap and it's not empty
    public mutating func extractMax() -> ComparableType {
        let max = array[0]
        array[0] = array[heapSize-1]
        heapSize -= 1
        maxHeapify()
        return max
    }

    /// Assumes the heap is a min-heap and it's not empty
    public mutating func extractMin() -> ComparableType {
        let min = array[0]
        array[0] = array[heapSize-1]
        heapSize -= 1
        minHeapify()
        return min
    }

    public mutating func swapAt(_ i: Int, _ j: Int) {
        array.swapAt(i, j)
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

    public mutating func buildMaxHeap() {
        let nonLeafNodeCount = heapSize/2
        for i in (0..<nonLeafNodeCount).reversed() {
            maxHeapify(i: i)
        }
    }

    public mutating func buildMinHeap() {
        let nonLeafNodeCount = heapSize/2
        for i in (0..<nonLeafNodeCount).reversed() {
            minHeapify(i: i)
        }
    }

    /// Assumes i is within bounds of the array. Does nothing if key is not greater than the current element at index i.
    public mutating func increaseKey(i initialIndex: Int, key: ComparableType) {
        var i = initialIndex
        guard key >= array[i] else {
            return
        }

        while i > 0 && array[parent(i: i)] < key {
            array[i] = array[parent(i: i)]
            i = parent(i: i)
        }
        array[i] = key
    }

    /// Assumes i is within bounds of the array. Does nothing if key is not less than the current element at index i.
    public mutating func decreaseKey(i initialIndex: Int, key: ComparableType) {
        var i = initialIndex
        guard key <= array[i] else {
            return
        }

        while i > 0 && array[parent(i: i)] > key {
            array[i] = array[parent(i: i)]
            i = parent(i: i)
        }
        array[i] = key
    }

    /// Assumes heap does not currently contain the new key
    public mutating func maxInsert(key: ComparableType) {
        var i = heapSize
        heapSize += 1
        array.insert(key, at: i)

        while i > 0 && array[parent(i: i)] < array[i] {
            array.swapAt(i, parent(i: i))
            i = parent(i: i)
        }
    }

    /// Assumes heap does not currently contain the new key
    public mutating func minInsert(key: ComparableType) {
        var i = heapSize
        heapSize += 1
        array.insert(key, at: i)

        while i > 0 && array[parent(i: i)] > array[i] {
            array.swapAt(i, parent(i: i))
            i = parent(i: i)
        }
    }

    public mutating func delete(i initialIndex: Int) {
        // from increaseKey
        var i = initialIndex
        while i > 0 {
            array[i] = array[parent(i: i)]
            i = parent(i: i)
        }

        // from extractMax
        array[i] = array[heapSize-1]
        heapSize -= 1
        maxHeapify()
    }
}
