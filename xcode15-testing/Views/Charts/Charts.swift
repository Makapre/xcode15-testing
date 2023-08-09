//
//  Charts.swift
//  xcode15-testing
//
//  Created by Marius Preikschat on 09.08.23.
//

import SwiftUI

struct Charts: View {
    var body: some View {
        NavigationView {
            List {
                NavigationLink(destination: PieChart()) {
                    Text("PieChart")
                }
                NavigationLink(destination: PieChartOuterRadius()) {
                    Text("PieChart outer radius")
                }
                NavigationLink(destination: PieChartAnnotation()) {
                    Text("PieChart annotation")
                }
                NavigationLink(destination: DonutChart()) {
                    Text("DonutChart")
                }
                NavigationLink(destination: DonutChartAnnotation()) {
                    Text("DonutChart annotation")
                }
                NavigationLink(destination: DonutChartInteraction()) {
                    Text("DonutChart interaction")
                }
            }
        }
    }
}

#Preview {
    Charts()
}
