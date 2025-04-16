//
//  ControlsView.swift
//  ComplexityExplorer
//
//  Created by Enrique Gongora on 4/16/25.
//

import SwiftUI

struct ControlsView: View {
    @Binding var inputSize: Double
    @Binding var yType: ChartScaleType
    
    var body: some View {
        HStack {
            LabeledContent {
                Slider(value: $inputSize, in: 2...32, step: 1)
            } label: {
                Text("Input size: \(Int(inputSize))")
                    .frame(minWidth: 100)
            }
            
            Picker("Chart Type", selection: $yType) {
                Text("Linear").tag(ChartScaleType.linear)
                Text("Logarithmic").tag(ChartScaleType.logarithmic)
            }
            .pickerStyle(.segmented)
            .labelsHidden()
            .fixedSize()
        }
        .padding([.horizontal, .bottom])
    }
}

#Preview {
    ControlsView(inputSize: .constant(2), yType: .constant(.linear))
}
