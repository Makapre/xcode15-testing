//
//  xcode15_testingApp.swift
//  xcode15-testing
//
//  Created by Marius Preikschat on 08.08.23.
//

import SwiftUI

@main
struct xcode15_testingApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Dog.self)
    }
}
