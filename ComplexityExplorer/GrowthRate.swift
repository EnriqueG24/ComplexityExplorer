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
            GrowthRate(id: "Linear", function: linearGrowth)
        ]
    }
    
    static func ==(lhs: GrowthRate, rhs: GrowthRate) -> Bool {
        lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func linearGrowth(_ n: Int) -> Double {
        Double(n)
    }
}
