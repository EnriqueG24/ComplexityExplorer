//
//  ChartScaleType.swift
//  ComplexityExplorer
//
//  Created by Enrique Gongora on 4/16/25.
//

import Charts

enum ChartScaleType {
    case linear
    case logarithmic
    
    var chartsType: ScaleType {
        switch self {
        case .linear:
                .linear
        case .logarithmic:
                .symmetricLog
        }
    }
}
