//
//  LoginLoginViewTests.swift
//  HobbyApp
//
//  Created by Oleg Leizer on 06/11/2017.
//  Copyright © 2017 idev.kz. All rights reserved.
//

import XCTest
@testable import HobbyApp

class LoginViewTests: XCTestCase {
    private var view: LoginViewController?
    private var output: LoginViewOutputMock?
    override func setUp() {
        super.setUp()
        view = LoginViewController()
        output = LoginViewOutputMock()
        view?.output = output
    }

    override func tearDown() {
        view = nil
        output = nil
        super.tearDown()
    }
    func testSuccessViewDidLoad() {
        self.view?.viewDidLoad()
        XCTAssert(self.output?.viewIsReadyWasCalled == true)
    }
    
//    func testLoginAction() {
//        view?.setEmail(email: "test@test.test")
//        self.view?.loginAction(self)
//        XCTAssert(self.output?.loginActionWasCalled == true)
//    }
    
    final class LoginViewOutputMock: LoginViewOutput {
        var viewIsReadyWasCalled: Bool = false
        var loginActionWasCalled: Bool = false
        
        func setupValidation(forEmailInput emailInput: AnyValidatableControl<String>) {
            
        }
        
        func login(_ email: String) {
            loginActionWasCalled = true
        }
        

        func viewIsReady() {
            viewIsReadyWasCalled = true
        }
    }
}
