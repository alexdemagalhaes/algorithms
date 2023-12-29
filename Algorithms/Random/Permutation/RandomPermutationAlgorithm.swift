//
//  RandomPermutationAlgorithm.swift
//  Algorithms
//
//  Created by Alex Magalhaes on 12/20/23.
//  Copyright © 2023 Alex Machado. All rights reserved.
//

import Foundation

public protocol RandomPermutationAlgorithm {
    associatedtype ElementType

    init(input: [ElementType])
    func permute() -> [ElementType]
}
