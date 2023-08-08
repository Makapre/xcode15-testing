//
//  EmptyViewCustom.swift
//  xcode15-testing
//
//  Created by Marius Preikschat on 08.08.23.
//

import SwiftUI

struct ContentUnavailableViewCustom: View {
    var body: some View {
        ContentUnavailableView {
            Label("Custom title with image", systemImage: "tray.and.arrow.down.fill")
        } description: {
            Text("Bla bla description...")
        } actions: {
            Button("klick me") {
                print("du hast gedrückt hehe")
            }
        }
    }
}

#Preview {
    ContentUnavailableViewCustom()
}
