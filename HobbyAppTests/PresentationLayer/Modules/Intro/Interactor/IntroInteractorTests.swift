//
//  IntroIntroInteractorTests.swift
//  HobbyApp
//
//  Created by Oleg Leizer on 07/11/2017.
//  Copyright © 2017 idev.kz. All rights reserved.
//

import XCTest
@testable import HobbyApp

class IntroInteractorTests: XCTestCase {
    private var interactor: IntroInteractor = IntroInteractor()
    private var presenter: MockPresenter = MockPresenter()

    override func setUp() {
        super.setUp()
        interactor = IntroInteractor()
        presenter = MockPresenter()
        interactor.output = presenter
    }

    override func tearDown() {
        super.tearDown()
    }
    
    func testUserNotLogged() {
        var authToken = AuthToken()
        authToken.token = nil
        XCTAssertFalse(interactor.checkIfLoggedIn())
    }
    
    func testCheckIfLoggedIn() {
        var authToken = AuthToken()
        authToken.token = "Token"
        XCTAssertTrue(interactor.checkIfLoggedIn())
    }
    
    func testLoadUserSuccessWasCalled() {
        presenter.loadUserSuccessful()
        XCTAssertTrue(presenter.loadUserSuccesfulWasCalled)
    }
    func testLoadUserFailureWasCalled() {
        presenter.loadUserFailure(NSError())
        XCTAssertTrue(presenter.loadUserFailureWasCalled)
    }
    class MockPresenter: IntroInteractorOutput {
        var loadUserSuccesfulWasCalled: Bool = false
        var loadUserFailureWasCalled: Bool = false

        func loadUserSuccessful() {
            loadUserSuccesfulWasCalled = true
        }
        
        func loadUserFailure(_ error: Error) {
            loadUserFailureWasCalled = true
        }
    }
}
