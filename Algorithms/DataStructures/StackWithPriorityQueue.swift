//
//  StackWithPriorityQueue.swift
//  Algorithms
//
//  Created by Alex Magalhaes on 1/5/24.
//  Copyright © 2024 Alex Machado. All rights reserved.
//

import Foundation

private class StackElement<ElementType>: Comparable {
    let key: Int
    let element: ElementType

    init(key: Int, element: ElementType) {
        self.key = key
        self.element = element
    }

    static func == (lhs: StackElement<ElementType>, rhs: StackElement<ElementType>) -> Bool {
        lhs.key == rhs.key
    }

    static func < (lhs: StackElement<ElementType>, rhs: StackElement<ElementType>) -> Bool {
        lhs.key < rhs.key
    }
}

public struct StackWithPriorityQueue<ElementType> {
    private var heap = Heap(input: [StackElement<ElementType>]())

    public var isEmpty: Bool {
        heap.heapSize == 0
    }

    public mutating func push(x: ElementType) {
        let stackEntry = StackElement(key: heap.heapSize, element: x)
        heap.maxInsert(key: stackEntry)
    }

    public mutating func pop() -> ElementType {
        let stackEntry = heap.extractMax()
        return stackEntry.element
    }
}
