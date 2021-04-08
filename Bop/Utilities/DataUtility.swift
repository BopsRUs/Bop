//
//  DataUtility.swift
//  Bop
//
//  Created by Justin Hurley on 3/31/21.
//

import Foundation
import GameplayKit
func dummyDoubleArray(size: Int) -> [(Double)] {
    let random = GKRandomSource()
    let randMean = Float.random(in: 0...100)
    let randPrice = GKGaussianDistribution(randomSource: random, mean: randMean, deviation: 10)
    var arr: [Double] = []
    for _ in 1...size{
        let num = abs(Double(randPrice.nextInt()))
        let dec = Double(randPrice.nextInt())/100
        arr.append(num + dec)
    }
    return arr
}

func getDifference(data: [(Double)]) -> Double {
    let first = data.first ?? 0
    let last = data.last ?? 0
    return (last - first)
}


