//
//  ContentView.swift
//  xcode15-testing
//
//  Created by Marius Preikschat on 08.08.23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            DogView()
                .tabItem {
                    Label("Dog", systemImage: "pawprint")
                }
            ContentUnavailableViewList()
                .tabItem {
                    Label("CUV", systemImage: "magnifyingglass")
                }
            Charts()
                .tabItem {
                    Label("Charts", systemImage: "chart.pie")
                }
        }
    }
}

#Preview {
    ContentView()
}
