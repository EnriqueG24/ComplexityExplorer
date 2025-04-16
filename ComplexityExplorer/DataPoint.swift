//
//  DataPoint.swift
//  ComplexityExplorer
//
//  Created by Enrique Gongora on 4/16/25.
//

import Foundation

struct DataPoint: Identifiable {
    let id = UUID()
    var x: Int
    var y: Double
    let rate: String
}
