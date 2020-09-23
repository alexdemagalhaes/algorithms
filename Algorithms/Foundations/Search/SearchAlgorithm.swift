//
//  SearchAlgorithm.swift
//  Algorithms
//
//  Created by Alex Magalhaes on 09/23/20.
//  Copyright © 2020 Alex Machado. All rights reserved.
//

public protocol SearchAlgorithm {
    associatedtype ComparableType: Comparable

    func search(for value: ComparableType) -> Int?
}

struct AnySearchAlgorithm<ComparableType: Comparable> {
    private let searchMethod: (ComparableType) -> Int?

    init<Algorithm: SearchAlgorithm>(_ algorithm: Algorithm) where Algorithm.ComparableType == ComparableType {
        self.searchMethod = algorithm.search
    }

    func search(for value: ComparableType) -> Int? {
        return searchMethod(value)
    }
}
