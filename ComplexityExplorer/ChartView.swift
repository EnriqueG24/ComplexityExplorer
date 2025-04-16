//
//  ChartView.swift
//  ComplexityExplorer
//
//  Created by Enrique Gongora on 4/16/25.
//

import SwiftUI
import Charts

struct ChartView: View {
    var inputSize: Double
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
        .chartXScale(domain: 0...inputSize)
        .chartYScale(domain: 0...yPeak)
        .chartYAxis {
            AxisMarks(preset: .automatic) { value in
                AxisGridLine()
                
                AxisValueLabel {
                    let value = value.as(Decimal.self) ?? 0
                    
                    Text("\(value.formatted(.number))")
                        .frame(minWidth: 30, maxWidth: .infinity, alignment: .leading)
                }
            }
        }
        .padding()
    }
    
    init(selectedItems: Set<GrowthRate>, inputSize: Double) {
        self.inputSize = inputSize
        dataPoints = selectedItems.flatMap { rate in
            (0...Int(inputSize)).map { x in
                DataPoint(x: x, y: rate.function(x), rate: rate.id)
            }
        }
        
        yPeak = dataPoints.max { $0.y < $1.y }?.y ?? 2
        if yPeak.isNaN { yPeak = 2 }
    }
}

#Preview {
    ChartView(selectedItems: Set(GrowthRate.all), inputSize: 16)
}
