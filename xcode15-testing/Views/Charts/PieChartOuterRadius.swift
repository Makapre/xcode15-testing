//
//  PieChartOuterRadius.swift
//  xcode15-testing
//
//  Created by Marius Preikschat on 09.08.23.
//

import SwiftUI
import Charts

struct PieChartOuterRadius: View {
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
                            outerRadius: coffee.name == "Latte" ? 150 : 120,
                            angularInset: 0.8
                        )
                        .foregroundStyle(by: .value("Type", coffee.name))
                    }
                }
            }
            .padding()
        }
        .navigationTitle(Text("PieChart outer Radius"))
    }
}

#Preview {
    PieChartOuterRadius()
}
