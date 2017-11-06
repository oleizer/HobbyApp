//
//  CityCityPresenterTests.swift
//  HobbyApp
//
//  Created by Oleg Leizer on 03/11/2017.
//  Copyright © 2017 idev.kz. All rights reserved.
//

import XCTest

class CityPresenterTest: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    class MockInteractor: CityInteractorInput {

    }

    class MockRouter: CityRouterInput {
        func showAddCity() {
            print("Show city")
        }
        

    }

    class MockViewController: CityViewInput {

        func setupInitialState() {

        }
    }
}
