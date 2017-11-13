//
//  ActivityDetailActivityDetailPresenterTests.swift
//  HobbyApp
//
//  Created by Oleg Leizer on 10/11/2017.
//  Copyright © 2017 idev.kz. All rights reserved.
//

import XCTest
@testable import HobbyApp

class ActivityDetailPresenterTest: XCTestCase {
    private var presenter: ActivityDetailPresenter = ActivityDetailPresenter()
    private var view: MockViewController = MockViewController()

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        presenter = ActivityDetailPresenter()
        presenter.router = MockRouter()
        view = MockViewController()
        presenter.view = view
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testThatPresenterHandlesViewIsReadyEvent() {
        //presenter.viewIsReady()
        //XCTAssertTrue((presenter.view as! MockViewController).setupInitialStateWasCalled)
    }

    class MockInteractor: ActivityDetailInteractorInput {

    }

    class MockRouter: ActivityDetailRouterInput {
        var transitionHandler: ModuleTransitionSource!
        

    }

    class MockViewController: ActivityDetailViewInput {
        func showProgress() {
            
        }
        
        func hideProgress() {
            
        }
        

        func setupInitialState() {

        }
    }
}
