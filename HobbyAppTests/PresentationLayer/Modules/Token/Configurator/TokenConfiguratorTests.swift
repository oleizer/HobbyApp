//
//  TokenTokenConfiguratorTests.swift
//  HobbyApp
//
//  Created by Oleg Leizer on 06/11/2017.
//  Copyright © 2017 idev.kz. All rights reserved.
//

import XCTest
@testable import HobbyApp

class TokenModuleConfiguratorTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testConfigureModuleForViewController() {

        //given
        let viewController = TokenViewControllerMock()
        let configurator = TokenModuleConfigurator()

        //when
        configurator.configureModuleForViewInput(viewInput: viewController)

        //then
        XCTAssertNotNil(viewController.output, "TokenViewController is nil after configuration")
        XCTAssertTrue(viewController.output is TokenPresenter, "output is not TokenPresenter")

        let presenter: TokenPresenter = viewController.output as! TokenPresenter
        XCTAssertNotNil(presenter.view, "view in TokenPresenter is nil after configuration")
        XCTAssertNotNil(presenter.router, "router in TokenPresenter is nil after configuration")
        XCTAssertTrue(presenter.router is TokenRouter, "router is not TokenRouter")

        let interactor: TokenInteractor = presenter.interactor as! TokenInteractor
        XCTAssertNotNil(interactor.output, "output in TokenInteractor is nil after configuration")
    }

    class TokenViewControllerMock: TokenViewController {

        var setupInitialStateDidCall = false

        override func setupInitialState() {
            setupInitialStateDidCall = true
        }
    }
}
