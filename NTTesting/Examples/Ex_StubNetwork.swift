//
//  Ex_StubNetworkSpec.swift
//  NTTesting
//
//  Created by Thuyen Trinh on 1/1/17.
//  Copyright © 2017 Thuyen Trinh. All rights reserved.
//

import Quick
import Nimble
import Mockingjay

class Ex_StubNetworkSpec: QuickSpec {
    override func spec() {
        beforeEach {
            let body_user = [
                "user": "thuyen@example.com",
                "firstName": "Thuyen",
                "lastName": "Trinh"
            ]
            
            self.stub(http(.get, uri: "https://api/v1/user"), json(body_user))
        }
        
        describe("ApiClient") {
            context("with api: User info") {
                it("should return the STUBBED info") {
                    
                }
            }
        }
        
    }
}
