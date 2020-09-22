//
//  SortingAlgorithm.swift
//  Algorithms
//
//  Created by Alex Magalhaes on 09/22/20.
//  Copyright © 2020 Alex Machado. All rights reserved.
//

public protocol SortingAlgorithm {
    associatedtype ComparableType: Comparable
    
    func sort() -> [ComparableType]
}

struct AnySortingAlgorithm<ComparableType: Comparable> {
    private let sortMethod: () -> [ComparableType]

    init<Algorithm: SortingAlgorithm>(_ algorithm: Algorithm) where Algorithm.ComparableType == ComparableType {
        self.sortMethod = algorithm.sort
    }

    func sort() -> [ComparableType] {
        return sortMethod()
    }
}
