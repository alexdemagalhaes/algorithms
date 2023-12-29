//
//  HeapTests.swift
//  AlgorithmsTests
//
//  Created by Alex Magalhaes on 12/29/23.
//  Copyright © 2023 Alex Machado. All rights reserved.
//

@testable import Algorithms
import XCTest

final class HeapTests: XCTestCase {
    func testMaxHeapify() {
        var heap = Heap(array: [-1, 17, 10, 16, 13, 9, 1, 5, 7, 12, 4, 8, 3, 0])
        heap.maxHeapify()

        XCTAssertEqual(heap.heapArray, [17, 16, 10, 7, 13, 9, 1, 5, -1, 12, 4, 8, 3, 0])
    }

    func testMaxHeapifyAtIndex2() {
        var heap = Heap(array: [27, 17, 3, 16, 13, 10, 1, 5, 7, 12, 4, 8, 9, 0])
        heap.maxHeapify(i: 2)

        XCTAssertEqual(heap.heapArray, [27, 17, 10, 16, 13, 9, 1, 5, 7, 12, 4, 8, 3, 0])
    }

    func testMinHeapify() {
        var heap = Heap(array: [30, 17, 10, 18, 26, 11, 14, 19, 24, 27, 28, 20, 15, 23])
        heap.minHeapify()

        XCTAssertEqual(heap.heapArray, [10, 17, 11, 18, 26, 15, 14, 19, 24, 27, 28, 20, 30, 23])
    }

    func testMinHeapifyAtIndex1() {
        var heap = Heap(array: [0, 24, 10, 17, 26, 11, 14, 19, 18, 27, 28, 20, 15, 23])
        heap.minHeapify(i: 1)

        XCTAssertEqual(heap.heapArray, [0, 17, 10, 18, 26, 11, 14, 19, 24, 27, 28, 20, 15, 23])
    }

    func testMaxHeapifyNonRecursive() {
        var heap = Heap(array: [-1, 17, 10, 16, 13, 9, 1, 5, 7, 12, 4, 8, 3, 0])
        heap.maxHeapifyNonRecursive()

        XCTAssertEqual(heap.heapArray, [17, 16, 10, 7, 13, 9, 1, 5, -1, 12, 4, 8, 3, 0])
    }

    func testMaxHeapifyNonRecursiveAtIndex2() {
        var heap = Heap(array: [27, 17, 3, 16, 13, 10, 1, 5, 7, 12, 4, 8, 9, 0])
        heap.maxHeapifyNonRecursive(i: 2)

        XCTAssertEqual(heap.heapArray, [27, 17, 10, 16, 13, 9, 1, 5, 7, 12, 4, 8, 3, 0])
    }
}
