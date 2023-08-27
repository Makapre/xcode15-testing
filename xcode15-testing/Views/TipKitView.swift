//
//  TipKitView.swift
//  xcode15-testing
//
//  Created by Marius Preikschat on 27.08.23.
//

import SwiftUI
import TipKit

struct SampleTip: Tip {
    var title: Text {
        Text("Title of the tip")
    }
    
    var message: Text? {
        Text("This is the tip message text")
    }
    
    var image: Image? {
        Image(systemName: "star")
    }
}

struct SampleNoImageTip: Tip {
    var title: Text {
        Text("Title of the tip")
    }
    
    var message: Text? {
        Text("This is the tip message text")
    }
}

struct SampleOnlyTitleTip: Tip {
    @Parameter
    static var showTip: Bool = false
    
    var rules: [Rule] {
        // Define a rule based on the app state.
        #Rule(Self.$showTip) {
            // Set the conditions for when the tip displays.
            $0 == true
        }
    }
    
    var title: Text {
        Text("Title of the tip")
    }
}

struct TipKitView: View {
    var sampleTip = SampleTip()
    var sampleNoImageTip = SampleNoImageTip()
    var sampleOnlyTitleTip = SampleOnlyTitleTip()

    var body: some View {
        List {
            VStack {
                // Place the tip view near the feature you want to highlight.
                TipView(sampleTip, arrowEdge: .bottom)
                
                Image(systemName: "star")
                    .imageScale(.large)
            }
            VStack {
                // Place the tip view near the feature you want to highlight.
                TipView(sampleNoImageTip, arrowEdge: .bottom)
                
                Image(systemName: "trash")
                    .imageScale(.large)
            }
            VStack {
                // Place the tip view near the feature you want to highlight.
                TipView(sampleOnlyTitleTip, arrowEdge: .bottom)
                
                Button("toggle tip") {
                    SampleOnlyTitleTip.showTip.toggle()
                }
                .buttonStyle(.bordered)
                .tint(.cyan)
            }
        }
        .task {
            // resets data store for testing
            try? Tips.resetDatastore()
            
            // Configure and load your tips at app launch.
            try? Tips.configure([
                .displayFrequency(.immediate),
                .datastoreLocation(.applicationDefault)
            ])
        }
    }
}

#Preview {
    TipKitView()
}
