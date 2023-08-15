//
//  EmptyViewSearch.swift
//  xcode15-testing
//
//  Created by Marius Preikschat on 08.08.23.
//

import SwiftUI

struct ContentUnavailableViewSearch: View {
    var body: some View {
        NavigationStack {
            ContentUnavailableView.search
        }
        .navigationTitle(Text("Content unavailable preset"))
    }
}

#Preview {
    ContentUnavailableViewSearch()
}
