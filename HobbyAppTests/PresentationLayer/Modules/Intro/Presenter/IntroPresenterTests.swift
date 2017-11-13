//
//  IntroIntroPresenterTests.swift
//  HobbyApp
//
//  Created by Oleg Leizer on 07/11/2017.
//  Copyright © 2017 idev.kz. All rights reserved.
//

import XCTest
@testable import HobbyApp

class IntroPresenterTest: XCTestCase {
    private var presenter: IntroPresenter = IntroPresenter()
    private var view: MockViewController = MockViewController()
    override func setUp() {
        super.setUp()
        presenter = IntroPresenter()
        presenter.router = MockRouter()
        view = MockViewController()
        presenter.view = view
    }

    override func tearDown() {
        super.tearDown()
    }

    func testThatPresenterHandlesViewLoadedEvent() {
        presenter.viewIsReady()
        XCTAssertTrue((presenter.view as! MockViewController).setupInitialStateWasCalled)
    }
    func testLoginModuleWasCalled() {
        var token = AuthToken()
        token.token = nil
        presenter.continueAction()
        XCTAssertTrue((presenter.router as! MockRouter).showLoginModuleWasCalled)
    }
//    func testActivityModuleWasCalled() {
//        var token = AuthToken()
//        token.token = "Token"
//        presenter.continueAction()
//        //XCTAssertTrue((presenter.router as! MockRouter).showActivityModuleWasCalled)
//    }
    class MockInteractor: IntroInteractorInput {
        func loadUser() {
            
        }
        

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

    class MockViewController: IntroViewInput {
        func showProgress() {
            
        }
        
        func hideProgress() {
            
        }
        
        var setupInitialStateWasCalled: Bool = false
        func setupInitialState() {
            setupInitialStateWasCalled = true
        }
    }
}
