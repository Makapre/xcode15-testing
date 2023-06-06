//
//  ContentView.swift
//  xcode15-testing
//
//  Created by Marius Preikschat on 06.06.23.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment (\.modelContext) private var modelContext
    
    @Query(sort: \.name)
    var dogs: [Dog]
    
    var body: some View {
        NavigationView {
            List(dogs) { dog in
                Text(dog.name)
            }
            .toolbar {
                Button("Add") {
                    let dog = Dog(name: "Bjarki")
                    modelContext.insert(dog)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
