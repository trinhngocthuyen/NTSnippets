//
//  Ex_Cuckoo.swift
//  NTSnippets
//
//  Created by Thuyen Trinh on 1/1/17.
//  Copyright © 2017 Thuyen Trinh. All rights reserved.
//

import Quick
import Nimble
import Cuckoo

class Ex_CuckooSpec: QuickSpec {
    override func spec() {
        
        let mockPerson = MockPerson(name: "")
        
        describe("MockPerson") {
            beforeEach {
                reset(mockPerson)
                Cuckoo.stub(mockPerson) { (stub) in
                    when(stub.name.get).thenReturn("Thuyen")
                    when(stub.name.set(any())).thenDoNothing()
                    when(stub.age.get).thenReturn(25)
                    when(stub.age.set(any())).thenDoNothing()
                    when(stub.sayGreeting(to: any())).then { "Hi \($0.name)!" }
                }
            }
            
            it("should return the STUBBED info") {
                expect(mockPerson.name).to(equal("Thuyen"))
                expect(mockPerson.age).to(equal(25))
                expect(mockPerson.sayGreeting(to: Person(name: "Chris"))).to(equal("Hi Chris!"))
            }
            
            context("make friend") {
                it("should say greetings") {
                    mockPerson.makeFriend(with: Person(name: "Sophia"))
                    verify(mockPerson).sayGreeting(to: ParameterMatcher { p in p.name == "Sophia" })
                }
            }
        }
    }
}
