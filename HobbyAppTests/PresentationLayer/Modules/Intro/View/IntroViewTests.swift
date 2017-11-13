//
//  IntroIntroViewTests.swift
//  HobbyApp
//
//  Created by Oleg Leizer on 07/11/2017.
//  Copyright © 2017 idev.kz. All rights reserved.
//

import XCTest
@testable import HobbyApp

class IntroViewTests: XCTestCase {
    private var view: IntroViewController?
    private var output: IntroViewOutputMock?
    override func setUp() {
        super.setUp()
        
        view = IntroViewController()
        output = IntroViewOutputMock()
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
    func testContinueAction() {
        self.view?.nextButtonTouched(self)
        XCTAssert(self.output?.continueActionWasCalled == true)
    }
    final class IntroViewOutputMock: IntroViewOutput {
        var viewIsReadyWasCalled: Bool = false
        var continueActionWasCalled: Bool = false

        func continueAction() {
            continueActionWasCalled = true
        }
        
        
        func viewIsReady() {
            viewIsReadyWasCalled = true
        }
    }
}
