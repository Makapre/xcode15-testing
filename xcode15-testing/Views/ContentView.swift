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
            ContentUnavailableViewSearch()
                .tabItem {
                    Label("Search", systemImage: "magnifyingglass")
                }
            ContentUnavailableViewWifi()
                .tabItem {
                    Label("Wifi", systemImage: "wifi")
                }
            ContentUnavailableViewCustom()
                .tabItem {
                    Label("Custom", systemImage: "pencil")
                }
        }
    }
}

#Preview {
    ContentView()
}
