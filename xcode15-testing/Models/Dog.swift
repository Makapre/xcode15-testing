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
    @Attribute(.unique) var name: String

    init (name: String) {
        self.name = name
    }
}
