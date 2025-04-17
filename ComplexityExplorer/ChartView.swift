//
//  ChartView.swift
//  ComplexityExplorer
//
//  Created by Enrique Gongora on 4/16/25.
//

import SwiftUI
import Charts

struct ChartView: View {
    @State private var selectedX: Int?
    
    var inputSize: Double
    var dataPoints: [DataPoint]
    var yPeak: Double
    var yType: ChartScaleType
    
    var body: some View {
        Chart(dataPoints) { point in
            LineMark(
                x: .value("x", point.x),
                y: .value("y", point.y),
                series: .value("Rate", point.rate)
            )
            .foregroundStyle(by: .value("Rate", point.rate))
            
            if selectedX == point.x {
                PointMark(
                    x: .value("x", point.x),
                    y: .value("y", point.y)
                )
                .foregroundStyle(by: .value("Rate", point.rate))
                .annotation(position: .top) {
                    Text(point.y.formatted(.number.precision(.fractionLength(0...2))))
                        .padding(8)
                        .font(.title2.bold())
                        .background(.ultraThinMaterial)
                        .clipShape(.rect(cornerRadius: 10))
                }
            }
        }
        .chartXSelection(value: $selectedX)
        .chartXScale(domain: 0...inputSize)
        .chartYScale(domain: 0...yPeak, type: yType.chartsType)
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
        .padding(.top, 30)
    }
    
    init(selectedItems: Set<GrowthRate>, inputSize: Double, yType: ChartScaleType) {
        self.inputSize = inputSize
        self.yType = yType
        
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
    ChartView(selectedItems: Set(GrowthRate.all), inputSize: 16, yType: .linear)
}
