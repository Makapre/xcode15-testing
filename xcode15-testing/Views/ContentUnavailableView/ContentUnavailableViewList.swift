//
//  ContentUnavailableViewList.swift
//  xcode15-testing
//
//  Created by Marius Preikschat on 09.08.23.
//

import SwiftUI

struct ContentUnavailableViewList: View {
    var body: some View {
        NavigationView {
            List {
                NavigationLink(destination: ContentUnavailableViewSearch()) {
                    Text("ContentUnavailableViewSearch")
                }
                NavigationLink(destination: ContentUnavailableViewWifi()) {
                    Text("ContentUnavailableViewWifi")
                }
                NavigationLink(destination: ContentUnavailableViewCustom()) {
                    Text("ContentUnavailableViewCustom")
                }
            }
        }
    }
}

#Preview {
    ContentUnavailableViewList()
}
