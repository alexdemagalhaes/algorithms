//
//  Subarray.swift
//  Algorithms
//
//  Created by Alex Magalhaes on 12/29/23.
//  Copyright © 2023 Alex Machado. All rights reserved.
//

public struct Subarray<Number: SignedNumeric & Comparable>: Equatable {
    let low: Int
    let high: Int
    let sum: Number
}
