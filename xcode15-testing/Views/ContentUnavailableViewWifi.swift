//
//  EmptyViewWifi.swift
//  xcode15-testing
//
//  Created by Marius Preikschat on 08.08.23.
//

import SwiftUI

struct ContentUnavailableViewWifi: View {
    var body: some View {
        ContentUnavailableView("Wifi", systemImage: "wifi.exclamationmark", description: Text("No wifi available!"))
    }
}

#Preview {
    ContentUnavailableViewWifi()
}
