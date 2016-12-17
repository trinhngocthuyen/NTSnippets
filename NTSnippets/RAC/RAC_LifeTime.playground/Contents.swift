//: Playground - noun: a place where people can play

import UIKit
import ReactiveCocoa
import ReactiveSwift

class Person: NSObject {
    var name: String = ""
}

var person = Person()
person.reactive.lifetime.ended
    .on(event: { NSLog("\($0)") })

person = Person()   // Yield `completed`
