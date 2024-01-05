//
//  QueueWithPriorityQueue.swift
//  Algorithms
//
//  Created by Alex Magalhaes on 1/5/24.
//  Copyright © 2024 Alex Machado. All rights reserved.
//

import Foundation

private class QueueElement<ElementType>: Comparable {
    let key: Int
    let element: ElementType

    init(key: Int, element: ElementType) {
        self.key = key
        self.element = element
    }

    static func == (lhs: QueueElement<ElementType>, rhs: QueueElement<ElementType>) -> Bool {
        lhs.key == rhs.key
    }

    static func < (lhs: QueueElement<ElementType>, rhs: QueueElement<ElementType>) -> Bool {
        lhs.key < rhs.key
    }
}

public struct QueueWithPriorityQueue<ElementType> {
    private var heap = Heap(input: [QueueElement<ElementType>]())

    public var isEmpty: Bool {
        heap.heapSize == 0
    }

    public mutating func enqueue(x: ElementType) {
        let queueEntry = QueueElement(key: heap.heapSize, element: x)
        heap.minInsert(key: queueEntry)
    }

    public mutating func dequeue() -> ElementType {
        let queueEntry = heap.extractMin()
        return queueEntry.element
    }
}
