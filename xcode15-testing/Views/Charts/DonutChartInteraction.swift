//
//  DonutChartInteraction.swift
//  xcode15-testing
//
//  Created by Marius Preikschat on 09.08.23.
//

import SwiftUI
import Charts

struct DonutChartInteraction: View {
    @State private var selectedCount: Int?
    @State private var selectedSector: String?

    private var coffeeSales = [
        (name: "Americano", count: 120),
        (name: "Cappuccino", count: 234),
        (name: "Espresso", count: 62),
        (name: "Latte", count: 625),
        (name: "Mocha", count: 320),
        (name: "Affogato", count: 50)
    ]
    
    var body: some View {
        NavigationStack {
            VStack {
                Chart {
                    ForEach(coffeeSales, id: \.name) { coffee in
                        SectorMark(
                            angle: .value("Cup", coffee.count),
                            innerRadius: .ratio(0.7),
                            angularInset: 0.8
                        )
                        .opacity(selectedSector == nil ? 1.0 : (selectedSector == coffee.name ? 1.0 : 0.5))
                        .cornerRadius(10)
                        .foregroundStyle(by: .value("Type", coffee.name))
                        .annotation(position: .overlay) {
                            Text("\(coffee.count)")
                                .font(.headline)
                                .foregroundStyle(.white)
                        }
                    }
                }
                .chartAngleSelection(value: $selectedCount)
                .chartBackground { proxy in
                    Text("☕️")
                        .font(.system(size: 150))
                }
                .onChange(of: selectedCount) { oldValue, newValue in
                    if let newValue {
                        selectedSector = findSelectedSector(value: newValue)
                    } else {
                        selectedSector = nil
                    }
                }
            }
            .padding()
        }
        .navigationTitle(Text("DonutChart interaction"))
    }
    
    private func findSelectedSector(value: Int) -> String? {
        
        var accumulatedCount = 0
        
        let coffee = coffeeSales.first { (_, count) in
            accumulatedCount += count
            return value <= accumulatedCount
        }
        
        return coffee?.name
    }
}

#Preview {
    DonutChartInteraction()
}
