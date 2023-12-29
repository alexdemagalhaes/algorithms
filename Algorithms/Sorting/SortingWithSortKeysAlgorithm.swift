//
//  SortingWithSortKeysAlgorithm.swift
//  Algorithms
//
//  Created by Alex Magalhaes on 12/20/23.
//  Copyright © 2023 Alex Machado. All rights reserved.
//

import Foundation

public protocol SortingWithSortKeysAlgorithm {
    associatedtype ElementType
    associatedtype ComparableType: Comparable

    init(input: [ElementType], sortKeys: [ComparableType])
    func sort() -> [ElementType]
}
