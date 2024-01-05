//
//  StackWithPriorityQueueTests.swift
//  AlgorithmsTests
//
//  Created by Alex Magalhaes on 1/5/24.
//  Copyright © 2024 Alex Machado. All rights reserved.
//

@testable import Algorithms
import XCTest

final class StackWithPriorityQueueTests: XCTestCase {
    func testStackWithNumbers() {
        var stack = StackWithPriorityQueue<Int>()
        XCTAssertTrue(stack.isEmpty)

        stack.push(x: 4)
        XCTAssertFalse(stack.isEmpty)
        XCTAssertEqual(stack.pop(), 4)
        XCTAssertTrue(stack.isEmpty)

        stack.push(x: 10)
        stack.push(x: -1)
        XCTAssertFalse(stack.isEmpty)
        XCTAssertEqual(stack.pop(), -1)
        XCTAssertEqual(stack.pop(), 10)
        XCTAssertTrue(stack.isEmpty)

        stack.push(x: 0)
        XCTAssertFalse(stack.isEmpty)
        XCTAssertEqual(stack.pop(), 0)
        XCTAssertTrue(stack.isEmpty)

        stack.push(x: 30)
        stack.push(x: -5)
        stack.push(x: 0)
        stack.push(x: 10)
        stack.push(x: 25)
        XCTAssertFalse(stack.isEmpty)
        XCTAssertEqual(stack.pop(), 25)
        XCTAssertEqual(stack.pop(), 10)
        XCTAssertEqual(stack.pop(), 0)
        XCTAssertEqual(stack.pop(), -5)
        XCTAssertEqual(stack.pop(), 30)
        XCTAssertTrue(stack.isEmpty)
    }

    func testStackWithStrings() {
        var stack = StackWithPriorityQueue<String>()
        XCTAssertTrue(stack.isEmpty)

        stack.push(x: "foo")
        XCTAssertFalse(stack.isEmpty)
        XCTAssertEqual(stack.pop(), "foo")
        XCTAssertTrue(stack.isEmpty)

        stack.push(x: "bar")
        stack.push(x: "baz")
        XCTAssertFalse(stack.isEmpty)
        XCTAssertEqual(stack.pop(), "baz")
        XCTAssertEqual(stack.pop(), "bar")
        XCTAssertTrue(stack.isEmpty)

        stack.push(x: "foobar")
        XCTAssertFalse(stack.isEmpty)
        XCTAssertEqual(stack.pop(), "foobar")
        XCTAssertTrue(stack.isEmpty)

        stack.push(x: "alfa")
        stack.push(x: "foxtrot")
        stack.push(x: "papa")
        stack.push(x: "oscar")
        stack.push(x: "mike")
        XCTAssertFalse(stack.isEmpty)
        XCTAssertEqual(stack.pop(), "mike")
        XCTAssertEqual(stack.pop(), "oscar")
        XCTAssertEqual(stack.pop(), "papa")
        XCTAssertEqual(stack.pop(), "foxtrot")
        XCTAssertEqual(stack.pop(), "alfa")
        XCTAssertTrue(stack.isEmpty)
    }
}
