//
//  QueueWithPriorityQueueTests.swift
//  AlgorithmsTests
//
//  Created by Alex Magalhaes on 1/5/24.
//  Copyright © 2024 Alex Machado. All rights reserved.
//

@testable import Algorithms
import XCTest

final class QueueWithPriorityQueueTests: XCTestCase {
    func testQueueWithNumbers() {
        var queue = QueueWithPriorityQueue<Int>()
        XCTAssertTrue(queue.isEmpty)

        queue.enqueue(x: 7)
        XCTAssertFalse(queue.isEmpty)
        XCTAssertEqual(queue.dequeue(), 7)
        XCTAssertTrue(queue.isEmpty)

        queue.enqueue(x: 10)
        queue.enqueue(x: 8)
        XCTAssertFalse(queue.isEmpty)
        XCTAssertEqual(queue.dequeue(), 10)
        XCTAssertEqual(queue.dequeue(), 8)
        XCTAssertTrue(queue.isEmpty)

        queue.enqueue(x: 15)
        XCTAssertFalse(queue.isEmpty)
        XCTAssertEqual(queue.dequeue(), 15)
        XCTAssertTrue(queue.isEmpty)

        queue.enqueue(x: 30)
        queue.enqueue(x: -5)
        queue.enqueue(x: 0)
        queue.enqueue(x: 10)
        queue.enqueue(x: 25)
        XCTAssertFalse(queue.isEmpty)
        XCTAssertEqual(queue.dequeue(), 30)
        XCTAssertEqual(queue.dequeue(), -5)
        XCTAssertEqual(queue.dequeue(), 0)
        XCTAssertEqual(queue.dequeue(), 10)
        XCTAssertEqual(queue.dequeue(), 25)
        XCTAssertTrue(queue.isEmpty)
    }

    func testQueueWithStrings() {
        var queue = QueueWithPriorityQueue<String>()
        XCTAssertTrue(queue.isEmpty)

        queue.enqueue(x: "foobar")
        XCTAssertFalse(queue.isEmpty)
        XCTAssertEqual(queue.dequeue(), "foobar")
        XCTAssertTrue(queue.isEmpty)

        queue.enqueue(x: "foo")
        queue.enqueue(x: "bar")
        XCTAssertFalse(queue.isEmpty)
        XCTAssertEqual(queue.dequeue(), "foo")
        XCTAssertEqual(queue.dequeue(), "bar")
        XCTAssertTrue(queue.isEmpty)

        queue.enqueue(x: "test")
        XCTAssertFalse(queue.isEmpty)
        XCTAssertEqual(queue.dequeue(), "test")
        XCTAssertTrue(queue.isEmpty)

        queue.enqueue(x: "echo")
        queue.enqueue(x: "tango")
        queue.enqueue(x: "sierra")
        queue.enqueue(x: "zulu")
        queue.enqueue(x: "bravo")
        XCTAssertFalse(queue.isEmpty)
        XCTAssertEqual(queue.dequeue(), "echo")
        XCTAssertEqual(queue.dequeue(), "tango")
        XCTAssertEqual(queue.dequeue(), "sierra")
        XCTAssertEqual(queue.dequeue(), "zulu")
        XCTAssertEqual(queue.dequeue(), "bravo")
        XCTAssertTrue(queue.isEmpty)
    }
}
