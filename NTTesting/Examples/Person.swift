//
//  Person.swift
//  NTSnippets
//
//  Created by Thuyen Trinh on 1/1/17.
//  Copyright © 2017 Thuyen Trinh. All rights reserved.
//

import Foundation

class Person {
    var name: String = ""
    var age: Int = 0
    
    init(name: String) {
        self.name = name
    }
    
    func sayGreeting(to other: Person) -> String {
        return "Hello \(other.name)!"
    }
}

extension Person {
    func makeFriend(with other: Person) {
        _ = sayGreeting(to: other)
    }
}
