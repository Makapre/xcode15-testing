//
//  Dog.swift
//  xcode15-testing
//
//  Created by Marius Preikschat on 06.06.23.
//

import Foundation
import SwiftData

@Model
class Dog {
    init (name: String) {
        self.id = UUID()
        self.name = name
    }
    
    var id: UUID
    var name: String
}
