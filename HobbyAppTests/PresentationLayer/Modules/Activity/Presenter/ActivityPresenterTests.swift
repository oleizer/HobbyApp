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
    private var presenter: ActivityPresenter = ActivityPresenter()
    private var view: MockViewController = MockViewController()

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        presenter = ActivityPresenter()
        presenter.router = MockRouter()
        view = MockViewController()
        presenter.view = view
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    
    func testThatPresenterHandlesViewIsReadyEvent() {
       // presenter.viewIsReady()
        //XCTAssertTrue((presenter.view as! MockViewController).setupInitialStateWasCalled)
    }
    class MockInteractor: ActivityInteractorInput {
        func loadActivities() {
            
        }
    }

    class MockRouter: ActivityRouterInput {

    }

    class MockViewController: ActivityViewInput {
        var setupInitialStateWasCalled: Bool = false

        func showContent() {
            
        }
        
        func showNoContent() {
            
        }
        
        func showProgress() {
            
        }
        
        func hideProgress() {
            
        }
        

        func setupInitialState() {
            setupInitialStateWasCalled = true
        }
    }
}
