//
//  RandomPermutationTests.swift
//  AlgorithmsTests
//
//  Created by Alex Magalhaes on 12/20/23.
//  Copyright © 2023 Alex Machado. All rights reserved.
//

@testable import Algorithms
import XCTest

private struct TestElement {
    let value: String
}

final class PermuteBySortingAlgorithmTests: XCTestCase {
    private func testPermutation(withInput input: [TestElement]) {
        let algorithm = PermuteBySortingAlgorithm(input: input)
        let resultArray = algorithm.permute()
        let priorities = algorithm.priorities
        let sortedPriorities = priorities.sorted()

        for i in 0..<resultArray.count {
            guard let indexOfElementInInput = priorities.firstIndex(of: sortedPriorities[i]) else {
                XCTFail()
                return
            }
            XCTAssertEqual(resultArray[i].value, input[indexOfElementInInput].value)
        }
    }

    func testAHundredPermutations() {
        let input: [TestElement] = [
            .init(value: "A"),
            .init(value: "B"),
            .init(value: "C"),
            .init(value: "D"),
            .init(value: "E"),
            .init(value: "F")
        ]
        for _ in 1...100 {
            testPermutation(withInput: input)
        }
    }
}
