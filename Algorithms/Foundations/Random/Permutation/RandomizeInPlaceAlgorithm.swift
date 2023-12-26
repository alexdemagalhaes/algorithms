//
//  RandomizeInPlaceAlgorithm.swift
//  Algorithms
//
//  Created by Alex Magalhaes on 12/26/23.
//  Copyright © 2023 Alex Machado. All rights reserved.
//

import Foundation

public final class RandomizeInPlaceAlgorithm<ElementType>: RandomPermutationAlgorithm {
    private var array: [ElementType]

    public init(input: [ElementType]) {
        array = input
    }

    public func permute() -> [ElementType] {
        let n = array.count
        for i in 0..<n {
            let randomIndex = Int.random(in: i..<n)
            array.swapAt(i, randomIndex)
        }
        return array
    }
}
