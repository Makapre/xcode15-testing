//
//  Symbols.swift
//  xcode15-testing
//
//  Created by Marius Preikschat on 26.08.23.
//

import SwiftUI

struct Symbols: View {
    @State private var animationOn: Bool = false

    var body: some View {
        NavigationStack {
            withAnimation {
                VStack {
                    Button("Animate") {
                        animationOn.toggle()
                    }
                    .buttonStyle(.bordered)
                    .tint(.purple)
                    List {
                        Section("Animations") {
                            Label("Bounce up by layer", systemImage: "wifi")
                                .symbolEffect(.bounce.up.byLayer, value: animationOn)
                            Label("Variable color iterative", systemImage: "wifi")
                                .symbolEffect(.variableColor.cumulative.dimInactiveLayers.nonReversing, value: animationOn)
                            Label("Pulse by layer", systemImage: "wifi")
                                .symbolEffect(.pulse.byLayer, value: animationOn)
                        }
                        Section("Colors") {
                            HStack {
                                Image(systemName: "sun.rain.fill")
                                    .symbolRenderingMode(.multicolor)
                                    .padding(.trailing)
                                Text("Multicolor")
                            }
                            HStack {
                                Image(systemName: "calendar.badge.checkmark")
                                    .symbolRenderingMode(.hierarchical)
                                    .foregroundStyle(.green)
                                    .padding(.trailing)
                                Text("Hierarchical")
                            }
                            HStack {
                                Image(systemName: "wifi")
                                    .symbolRenderingMode(.monochrome)
                                    .padding(.trailing)
                                Text("Monochrome/ Standard")
                            }
                            HStack {
                                Image(systemName: "person.crop.circle.dashed.circle.fill")
                                    .symbolRenderingMode(.palette)
                                    .foregroundStyle(.pink, .mint)
                                    .padding(.trailing)
                                Text("Palette")
                            }
                            HStack {
                                Image(systemName: "arrow.triangle.2.circlepath.icloud")
                                    .symbolRenderingMode(.palette)
                                    .foregroundStyle(.green, .orange)
                                    .padding(.trailing)
                                Text("Palette")
                            }
                        }
                    }
                }
            }
        }
        .navigationTitle(Text("SF Symbols 5"))
    }
}

#Preview {
    Symbols()
}
