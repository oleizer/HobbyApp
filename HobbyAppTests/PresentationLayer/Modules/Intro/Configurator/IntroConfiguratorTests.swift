//
//  IntroIntroConfiguratorTests.swift
//  HobbyApp
//
//  Created by Oleg Leizer on 07/11/2017.
//  Copyright © 2017 idev.kz. All rights reserved.
//

import XCTest
@testable import HobbyApp

class IntroModuleConfiguratorTests: XCTestCase {

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
        let viewController = IntroViewControllerMock()
        let configurator = IntroModuleConfigurator()

        //when
        configurator.configureModuleForViewInput(viewInput: viewController)

        //then
        XCTAssertNotNil(viewController.output, "IntroViewController is nil after configuration")
        XCTAssertTrue(viewController.output is IntroPresenter, "output is not IntroPresenter")

        let presenter: IntroPresenter = viewController.output as! IntroPresenter
        XCTAssertNotNil(presenter.view, "view in IntroPresenter is nil after configuration")
        XCTAssertNotNil(presenter.router, "router in IntroPresenter is nil after configuration")
        XCTAssertTrue(presenter.router is IntroRouter, "router is not IntroRouter")

        let interactor: IntroInteractor = presenter.interactor as! IntroInteractor
        XCTAssertNotNil(interactor.output, "output in IntroInteractor is nil after configuration")
    }

    class IntroViewControllerMock: IntroViewController {

        var setupInitialStateDidCall = false

        override func setupInitialState() {
            setupInitialStateDidCall = true
        }
    }
}
