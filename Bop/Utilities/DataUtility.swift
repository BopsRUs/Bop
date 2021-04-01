//
//  DataUtility.swift
//  Bop
//
//  Created by Justin Hurley on 3/31/21.
//

import Foundation
func dummyDoubleArray(size: Int) -> [(Double)] {
    let arr = (0..<size).map{_ in Double.random(in: 1 ... 100)}
    return arr
}

func getDifference(data: [(Double)]) -> Double {
    let first = data.first ?? 0
    let last = data.last ?? 0
    return (last - first)
}


