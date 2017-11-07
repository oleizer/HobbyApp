//
//  TokenTokenPresenterTests.swift
//  HobbyApp
//
//  Created by Oleg Leizer on 06/11/2017.
//  Copyright © 2017 idev.kz. All rights reserved.
//

import XCTest
@testable import HobbyApp

class TokenPresenterTest: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    class MockInteractor: TokenInteractorInput {
        func loadUser(_ token: String) {
            
        }
        

    }

    class MockRouter: TokenRouterInput {
        func showSelectCity() {
            
        }
        

    }

    class MockViewController: TokenViewInput {

        func setupInitialState() {

        }
    }
}
