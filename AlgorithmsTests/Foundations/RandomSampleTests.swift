//
//  RandomSampleTests.swift
//  AlgorithmsTests
//
//  Created by Alex Magalhaes on 12/26/23.
//  Copyright © 2023 Alex Machado. All rights reserved.
//

@testable import Algorithms
import XCTest

final class RandomSampleTests: XCTestCase {
    private func sortedSequence(n: Int) -> [Int] {
        var array = Array(repeating: 0, count: n)
        for i in 0..<n {
            array[i] = i+1
        }
        return array
    }

    private func testSample(m: Int, n: Int) {
        let algorithm = RandomSampleAlgorithm()
        let sample = algorithm.sample(m: m, n: n)
        XCTAssertEqual(sample.count, m)
        let sortedSequence = sortedSequence(n: n)
        sample.forEach { element in
            XCTAssertTrue(element >= 1 && element <= n)
            XCTAssertTrue(sortedSequence.contains(element))
        }
    }

    func testEmptySample() {
        testSample(m: 0, n: 10)
    }

    func testRandomSampleWithMLarge() {
        testSample(m: 265, n: 270)
    }

    func testRandomSampleWithNMuchLarger() {
        testSample(m: 5, n: 1043)
    }
}
