//
//  InterestInterestInteractorTests.swift
//  HobbyApp
//
//  Created by Oleg Leizer on 09/11/2017.
//  Copyright © 2017 idev.kz. All rights reserved.
//

import XCTest
@testable import HobbyApp

class InterestInteractorTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    class MockPresenter: InterestInteractorOutput {
        func loadInterestsSuccessful(_ interests: [Interest]) {
            
        }
        
        func loadInterestsFailed(_ error: Error) {
            
        }
        

    }
}
