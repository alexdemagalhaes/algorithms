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
    func testHeapElements() {
        var heap = Heap(input: [1, 2, 3, 4, 5, 6])
        heap.heapSize = 3
        XCTAssertEqual(heap.heapElements, [1, 2, 3])
    }

    func testHeapWithNoElements() {
        var heap = Heap(input: [1, 2, 3, 4, 5, 6])
        heap.heapSize = 0
        XCTAssertEqual(heap.heapElements, [])
    }

    func testMaximum() {
        var heap = Heap(input: [4, 1, 3, 2, 16, 9, 10, 14, 8, 7])
        heap.buildMaxHeap()
        XCTAssertEqual(heap.maximum, 16)
    }

    func testMaxHeapify() {
        var heap = Heap(input: [-1, 17, 10, 16, 13, 9, 1, 5, 7, 12, 4, 8, 3, 0])
        heap.maxHeapify()

        XCTAssertEqual(heap.heapArray, [17, 16, 10, 7, 13, 9, 1, 5, -1, 12, 4, 8, 3, 0])
    }

    func testMaxHeapifyAtIndex2() {
        var heap = Heap(input: [27, 17, 3, 16, 13, 10, 1, 5, 7, 12, 4, 8, 9, 0])
        heap.maxHeapify(i: 2)

        XCTAssertEqual(heap.heapArray, [27, 17, 10, 16, 13, 9, 1, 5, 7, 12, 4, 8, 3, 0])
    }

    func testMinHeapify() {
        var heap = Heap(input: [30, 17, 10, 18, 26, 11, 14, 19, 24, 27, 28, 20, 15, 23])
        heap.minHeapify()

        XCTAssertEqual(heap.heapArray, [10, 17, 11, 18, 26, 15, 14, 19, 24, 27, 28, 20, 30, 23])
    }

    func testMinHeapifyAtIndex1() {
        var heap = Heap(input: [0, 24, 10, 17, 26, 11, 14, 19, 18, 27, 28, 20, 15, 23])
        heap.minHeapify(i: 1)

        XCTAssertEqual(heap.heapArray, [0, 17, 10, 18, 26, 11, 14, 19, 24, 27, 28, 20, 15, 23])
    }

    func testMaxHeapifyNonRecursive() {
        var heap = Heap(input: [-1, 17, 10, 16, 13, 9, 1, 5, 7, 12, 4, 8, 3, 0])
        heap.maxHeapifyNonRecursive()

        XCTAssertEqual(heap.heapArray, [17, 16, 10, 7, 13, 9, 1, 5, -1, 12, 4, 8, 3, 0])
    }

    func testMaxHeapifyNonRecursiveAtIndex2() {
        var heap = Heap(input: [27, 17, 3, 16, 13, 10, 1, 5, 7, 12, 4, 8, 9, 0])
        heap.maxHeapifyNonRecursive(i: 2)

        XCTAssertEqual(heap.heapArray, [27, 17, 10, 16, 13, 9, 1, 5, 7, 12, 4, 8, 3, 0])
    }

    func testBuildMaxHeapWithEvenNumberOfElements() {
        var heap = Heap(input: [4, 1, 3, 2, 16, 9, 10, 14, 8, 7])
        heap.buildMaxHeap()

        XCTAssertEqual(heap.heapArray, [16, 14, 10, 8, 7, 9, 3, 2, 4, 1])
    }

    func testBuildMaxHeapWithOddNumberOfElements() {
        var heap = Heap(input: [10, 3, 5, 6, 7, 8, 11, 22, 13, 30, 27])
        heap.buildMaxHeap()

        XCTAssertEqual(heap.heapArray, [30, 27, 11, 22, 10, 8, 5, 6, 13, 7, 3])
    }

    func testBuildMaxHeapWithAnotherOddNumberOfElements() {
        var heap = Heap(input: [5, 3, 17, 10, 84, 19, 6, 22, 9])
        heap.buildMaxHeap()

        XCTAssertEqual(heap.heapArray, [84, 22, 19, 10, 3, 17, 6, 5, 9])
    }

    func testBuildMaxHeapFromMinHeap() {
        var heap = Heap(input: [10, 17, 11, 18, 26, 15, 14, 19, 24, 27, 28, 20, 30, 23])
        heap.buildMaxHeap()

        XCTAssertEqual(heap.heapArray, [30, 28, 23, 24, 27, 20, 14, 19, 18, 17, 26, 11, 15, 10])
    }

    func testBuildMinHeapWithEvenNumberOfElements() {
        var heap = Heap(input: [4, 1, 3, 2, 16, 9, 10, 14, 8, 7])
        heap.buildMinHeap()

        XCTAssertEqual(heap.heapArray, [1, 2, 3, 4, 7, 9, 10, 14, 8, 16])
    }

    func testBuildMinHeapWithOddNumberOfElements() {
        var heap = Heap(input: [50, 40, 60, 35, 20, 45, 47, 25, 30, 15, 10, 16, 21])
        heap.buildMinHeap()

        XCTAssertEqual(heap.heapArray, [10, 15, 16, 25, 20, 21, 47, 35, 30, 40, 50, 45, 60])
    }

    func testBuildMinHeapFromMaxHeap() {
        var heap = Heap(input: [17, 16, 10, 7, 13, 9, 1, 5, -1, 12, 4, 8, 3, 0])
        heap.buildMinHeap()

        XCTAssertEqual(heap.heapArray, [-1, 4, 0, 5, 12, 3, 1, 16, 7, 17, 13, 8, 9, 10])
    }

    func testExtractMax() {
        var heap = Heap(input: [15, 13, 9, 5, 12, 8, 7, 4, 0, 6, 2, 1])
        XCTAssertEqual(heap.extractMax(), 15)
        XCTAssertEqual(heap.heapElements, [13, 12, 9, 5, 6, 8, 7, 4, 0, 1, 2])
    }

    func testExtractMaxUntilHeapIsEmpty() {
        var heap = Heap(input: [15, 13, 9])
        XCTAssertEqual(heap.extractMax(), 15)
        XCTAssertEqual(heap.extractMax(), 13)
        XCTAssertEqual(heap.extractMax(), 9)
        XCTAssertEqual(heap.heapElements, [])
    }

    func testIncreaseKey() {
        var heap = Heap(input: [15, 13, 9])
        heap.increaseKey(i: 2, key: 16)
        XCTAssertEqual(heap.heapElements, [16, 13, 15])
    }

    func testIncreaseKeyMultiLevel() {
        var heap = Heap(input: [15, 13, 9, 5, 12, 8, 7, 4, 0, 6, 2, 1])
        heap.increaseKey(i: 9, key: 16)
        XCTAssertEqual(heap.heapElements, [16, 15, 9, 5, 13, 8, 7, 4, 0, 12, 2, 1])
    }

    func testIncreaseKeyLessThanCurrent() {
        var heap = Heap(input: [15, 13, 9, 5, 12, 8, 7, 4, 0, 6, 2, 1])
        heap.increaseKey(i: 9, key: -1)
        XCTAssertEqual(heap.heapArray, [15, 13, 9, 5, 12, 8, 7, 4, 0, 6, 2, 1])
    }

    func testMaxInsert() {
        var heap = Heap(input: [15, 13, 9, 5, 12, 8, 7, 4, 0, 6, 2, 1])
        heap.maxInsert(key: 10)
        XCTAssertEqual(heap.heapElements, [15, 13, 10, 5, 12, 9, 7, 4, 0, 6, 2, 1, 8])
    }

    func testMaxInsertUsingIncreaseKey() {
        var heap = Heap(input: [15, 13, 9, 5, 12, 8, 7, 4, 0, 6, 2, 1])
        heap.maxInsert(key: -10)
        heap.increaseKey(i: 12, key: 10)
        XCTAssertEqual(heap.heapElements, [15, 13, 10, 5, 12, 9, 7, 4, 0, 6, 2, 1, 8])
    }
}
