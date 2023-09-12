//
//  ContentView.swift
//  xcode15-testing
//
//  Created by Marius Preikschat on 06.06.23.
//

import SwiftUI
import SwiftData
import TipKit

struct DogTip: Tip {
    var rules: [Rule] {
        #Rule(DogView.hasNoDogs) {
            $0.donations.count > 0
        }
    }
    
    var title: Text {
        Text("Add new Dog here")
    }
    
    var message: Text? {
        Text("Press the add button to add a new dog with SwiftData.")
    }
    
    var image: Image? {
        Image(systemName: "pawprint")
    }
}

struct DogView: View {
    @Environment (\.modelContext) private var modelContext
    
    @Query(sort: \Dog.name, order: .forward)
    var dogs: [Dog]
    
    var dogTip = DogTip()
    
    static let hasNoDogs = Tips.Event(id: "hasNoDogs")
    
    var body: some View {
        NavigationStack {
            TipView(dogTip)

            List {
                ForEach(dogs) { dog in
                    Text(dog.name)
                    .contextMenu {
                        Button {
                            modelContext.delete(dog)
                        } label: {
                            Label("delete", systemImage: "trash")
                        }
                    }
                }
                .onDelete(perform: deleteDogs)
            }
            .toolbar {
                Button("Add") {
                    let dog = Dog(name: String("Bjarki".shuffled()))
                    modelContext.insert(dog)
                }
                EditButton()
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
        .onAppear {
            // example usage of keypath
            print(dogs.map(\.name))
            
            if dogs.isEmpty {
                Self.hasNoDogs.sendDonation()
            }
        }
        .navigationTitle(Text("SwiftData Example"))
    }
    
    private func deleteDogs(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(dogs[index])
            }
        }
    }
}

struct DogView_Previews: PreviewProvider {
    static var previews: some View {
        DogView()
    }
}
