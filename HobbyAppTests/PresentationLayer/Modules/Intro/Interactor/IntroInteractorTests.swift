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
    
    func testLoadUserSuccess() {
    }

    class MockPresenter: IntroInteractorOutput {
        func loadUserSuccessful(_ user: User) {
        }
        
        func loadUserFailure(_ error: Error) {
        }
    }
}
