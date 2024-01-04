//
//  HeapSort.swift
//  Algorithms
//
//  Created by Alex Magalhaes on 1/2/24.
//  Copyright © 2024 Alex Machado. All rights reserved.
//

public final class HeapSort<ComparableType: Comparable>: SortingAlgorithm {
    private var heap: Heap<ComparableType>

    public init(input: [ComparableType]) {
        heap = Heap(input: input)
    }

    public func sort() -> [ComparableType] {
        guard heap.length > 0 else { return [] }
        heap.buildMaxHeap()
        for i in (1..<heap.length).reversed() {
            heap.swapAt(0, i)
            heap.heapSize -= 1
            heap.maxHeapify(i: 0)
        }
        return heap.heapArray
    }
}
