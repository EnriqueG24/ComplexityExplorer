//
//  ChartView.swift
//  ComplexityExplorer
//
//  Created by Enrique Gongora on 4/16/25.
//

import SwiftUI
import Charts

struct ChartView: View {
    var dataPoints: [DataPoint]
    var yPeak: Double
    
    var body: some View {
        Chart(dataPoints) { point in
            LineMark(
                x: .value("x", point.x),
                y: .value("y", point.y),
                series: .value("Rate", point.rate)
            )
            .foregroundStyle(by: .value("Rate", point.rate))
        }
        .chartXScale(domain: 0...16)
        .chartYScale(domain: 0...yPeak)
        .padding()
    }
    
    init(selectedItems: Set<GrowthRate>) {
        dataPoints = selectedItems.flatMap { rate in
            (0...16).map { x in
                DataPoint(x: x, y: rate.function(x), rate: rate.id)
            }
        }
        
        yPeak = dataPoints.max { $0.y < $1.y }?.y ?? 2
        if yPeak.isNaN { yPeak = 2 }
    }
}

#Preview {
    ChartView(selectedItems: Set(GrowthRate.all))
}
