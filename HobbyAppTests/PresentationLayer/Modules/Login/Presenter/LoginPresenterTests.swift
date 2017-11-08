//
//  LoginLoginPresenterTests.swift
//  HobbyApp
//
//  Created by Oleg Leizer on 06/11/2017.
//  Copyright © 2017 idev.kz. All rights reserved.
//

import XCTest
@testable import HobbyApp

class LoginPresenterTest: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    class MockInteractor: LoginInteractorInput {
        func login(_ email: String, result: @escaping (UserSpecification.Error?) -> Void) {
            
        }
        
        func login(_ email: String) {
            
        }
        

    }

    class MockRouter: LoginRouterInput {
        func showToken() {
            
        }
        

    }

    class MockViewController: LoginViewInput {
        func showProgress() {
            
        }
        
        func hideProgress() {
            
        }
        
        func showLoadingHUD() {
            
        }
        
        func hideLoadingHUD() {
            
        }
        
        func showMessage(title: String, message: String) {
            
        }
        

        func setupInitialState() {

        }
    }
}
