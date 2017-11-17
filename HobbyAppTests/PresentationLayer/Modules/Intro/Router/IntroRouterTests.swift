//
//  IntroIntroRouterTests.swift
//  HobbyApp
//
//  Created by Oleg Leizer on 07/11/2017.
//  Copyright © 2017 idev.kz. All rights reserved.
//

import XCTest
@testable import HobbyApp

class IntroRouterTests: XCTestCase {
    private var router: MockRouter = MockRouter()

    override func setUp() {
        super.setUp()
        router = MockRouter()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        //router = nil
        super.tearDown()
    }
    func testLoginModuleWasCalled() {
        router.showLogin()
        XCTAssertTrue(router.showLoginModuleWasCalled)
    }
    func testActivityModuleWasCalled() {
        router.showActivity()
        XCTAssertTrue(router.showActivityModuleWasCalled)
    }
    class MockRouter: IntroRouterInput {
        var showLoginModuleWasCalled: Bool = false
        var showActivityModuleWasCalled: Bool = false
        
        func showActivity(){
            showActivityModuleWasCalled = true
        }
        
        func showLogin() {
            showLoginModuleWasCalled = true
        }
    }
}
