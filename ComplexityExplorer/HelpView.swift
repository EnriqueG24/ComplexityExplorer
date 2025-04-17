//
//  HelpView.swift
//  ComplexityExplorer
//
//  Created by Enrique Gongora on 4/16/25.
//

import SwiftUI

struct HelpItem: Decodable, Identifiable {
    var id: String
    var notation: String
    var description: String
    var examples: [String]
}

struct HelpView: View {
    let helpItems: [HelpItem] = Bundle.main.decode("help.json")
    var selectedItems: Set<GrowthRate>
    @Binding var showingHelp: Bool
    
    var selectedHelpItems: [HelpItem] {
        helpItems.filter { helpItem in
            selectedItems.contains { $0.id == helpItem.id }
        }
    }
    
    var body: some View {
        ScrollView {
            VStack {
                ForEach(selectedHelpItems) { helpItem in
                    VStack(alignment: .leading) {
                        Text(helpItem.id)
                            .font(.title2)
                            .bold()
                        
                        Text(helpItem.notation)
                            .foregroundStyle(.secondary)
                            .font(.headline)
                            .fontDesign(.serif)
                            .italic()
                        
                        Text(helpItem.description)
                            .padding(.bottom, 10)
                        
                        Text("**Examples:** \(helpItem.examples.joined(separator: ", ")).")
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.bottom, 25)
                }
            }
            .padding(10)
        }
        .inspectorColumnWidth(min: 200, ideal: 300)
        .toolbar {
            // This is required to get our other toolbar item on the right edge
            ToolbarItem {
                Spacer()
            }
            
            ToolbarItem {
                Button("Toggle help", systemImage: "sidebar.trailing") {
                    showingHelp.toggle()
                }
            }
        }
    }
}

#Preview {
    HelpView(selectedItems: [], showingHelp: .constant(false))
}
