//
//  RandomSampleAlgorithm.swift
//  Algorithms
//
//  Created by Alex Magalhaes on 12/26/23.
//  Copyright © 2023 Alex Machado. All rights reserved.
//

import Foundation

public final class RandomSampleAlgorithm {
    public func sample(m: Int, n: Int) -> Set<Int> {
        if m == 0 {
            return []
        }

        var s = sample(m: m-1, n: n-1)
        let i = Int.random(in: 1...n)
        if s.contains(i) {
            s.insert(n)
        } else {
            s.insert(i)
        }
        return s
    }
}
