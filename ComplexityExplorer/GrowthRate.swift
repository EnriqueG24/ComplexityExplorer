//
//  GrowthRate.swift
//  ComplexityExplorer
//
//  Created by Enrique Gongora on 4/16/25.
//

import Foundation

struct GrowthRate: Hashable, Identifiable {
    var id: String
    var function: (Int) -> Double
    
    static var all: [GrowthRate] {
        [
            GrowthRate(id: "Linear", function: linearGrowth),
            GrowthRate(id: "Constant", function: constantGrowth),
            GrowthRate(id: "Square Root", function: squareRootGrowth)
        ]
    }
    
    static func ==(lhs: GrowthRate, rhs: GrowthRate) -> Bool {
        lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    // O(n)
    static func linearGrowth(_ n: Int) -> Double {
        Double(n)
    }
    
    // O(1)
    static func constantGrowth(_ n: Int) -> Double {
        1
    }
    
    // O(sqrt(n))
    static func squareRootGrowth(_ n: Int) -> Double {
        sqrt(Double(n))
    }
}
