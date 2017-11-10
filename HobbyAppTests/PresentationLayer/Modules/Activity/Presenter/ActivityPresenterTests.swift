//
//  ActivityActivityPresenterTests.swift
//  HobbyApp
//
//  Created by Oleg Leizer on 10/11/2017.
//  Copyright © 2017 idev.kz. All rights reserved.
//

import XCTest
@testable import HobbyApp

class ActivityPresenterTest: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    class MockInteractor: ActivityInteractorInput {
        func loadActivities() {
            
        }
        

    }

    class MockRouter: ActivityRouterInput {

    }

    class MockViewController: ActivityViewInput {
        func showContent() {
            
        }
        
        func showNoContent() {
            
        }
        
        func showProgress() {
            
        }
        
        func hideProgress() {
            
        }
        

        func setupInitialState() {

        }
    }
}
