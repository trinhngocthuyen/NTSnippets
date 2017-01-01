// MARK: - Mocks generated from file: ../NTTesting/Examples/Person.swift at 2017-01-01 07:32:12 +0000

//
//  Person.swift
//  NTSnippets
//
//  Created by Thuyen Trinh on 1/1/17.
//  Copyright © 2017 Thuyen Trinh. All rights reserved.
//

import Cuckoo

import Foundation

class MockPerson: Person, Cuckoo.Mock {
    typealias MocksType = Person
    typealias Stubbing = __StubbingProxy_Person
    typealias Verification = __VerificationProxy_Person
    let manager = Cuckoo.MockManager()
    
    private var observed: Person?
    
    func spy(on victim: Person) -> Self {
        observed = victim
        return self
    }
    
    override var name: String {
        get {
            return manager.getter("name", original: observed.map { o in return { () -> String in o.name } })
        }
        set {
            manager.setter("name", value: newValue, original: observed != nil ? { self.observed?.name = $0 } : nil)
        }
    }
    
    override var age: Int {
        get {
            return manager.getter("age", original: observed.map { o in return { () -> Int in o.age } })
        }
        set {
            manager.setter("age", value: newValue, original: observed != nil ? { self.observed?.age = $0 } : nil)
        }
    }
    
    override func sayGreeting(to other: Person) -> String {
        return manager.call("sayGreeting(to: Person) -> String", parameters: (other), original: observed.map { o in return { (other: Person) -> String in o.sayGreeting(to: other) } })
    }
    
    struct __StubbingProxy_Person: Cuckoo.StubbingProxy {
        private let manager: Cuckoo.MockManager
        
        init(manager: Cuckoo.MockManager) {
            self.manager = manager
        }
        
        var name: Cuckoo.ToBeStubbedProperty<String> {
            return Cuckoo.ToBeStubbedProperty(manager: manager, name: "name")
        }
        
        var age: Cuckoo.ToBeStubbedProperty<Int> {
            return Cuckoo.ToBeStubbedProperty(manager: manager, name: "age")
        }
        
        func sayGreeting<M1: Cuckoo.Matchable>(to other: M1) -> Cuckoo.StubFunction<(Person), String> where M1.MatchedType == Person {
            let matchers: [Cuckoo.ParameterMatcher<(Person)>] = [wrap(matchable: other) { $0 }]
            return Cuckoo.StubFunction(stub: manager.createStub("sayGreeting(to: Person) -> String", parameterMatchers: matchers))
        }
    }
    
    struct __VerificationProxy_Person: Cuckoo.VerificationProxy {
        private let manager: Cuckoo.MockManager
        private let callMatcher: Cuckoo.CallMatcher
        private let sourceLocation: Cuckoo.SourceLocation
        
        init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
            self.manager = manager
            self.callMatcher = callMatcher
            self.sourceLocation = sourceLocation
        }
        
        var name: Cuckoo.VerifyProperty<String> {
            return Cuckoo.VerifyProperty(manager: manager, name: "name", callMatcher: callMatcher, sourceLocation: sourceLocation)
        }
        
        var age: Cuckoo.VerifyProperty<Int> {
            return Cuckoo.VerifyProperty(manager: manager, name: "age", callMatcher: callMatcher, sourceLocation: sourceLocation)
        }
        
        @discardableResult
        func sayGreeting<M1: Cuckoo.Matchable>(to other: M1) -> Cuckoo.__DoNotUse<String> where M1.MatchedType == Person {
            let matchers: [Cuckoo.ParameterMatcher<(Person)>] = [wrap(matchable: other) { $0 }]
            return manager.verify("sayGreeting(to: Person) -> String", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
    }
}

class PersonStub: Person {
    
    override var name: String {
        get {
            return DefaultValueRegistry.defaultValue(for: (String).self)
        }
        set {
        }
    }
    
    override var age: Int {
        get {
            return DefaultValueRegistry.defaultValue(for: (Int).self)
        }
        set {
        }
    }
    
    override func sayGreeting(to other: Person) -> String {
        return DefaultValueRegistry.defaultValue(for: (String).self)
    }
}
