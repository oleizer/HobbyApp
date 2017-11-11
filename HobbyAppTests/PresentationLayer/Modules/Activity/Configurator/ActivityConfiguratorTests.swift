//
//  ActivityActivityConfiguratorTests.swift
//  HobbyApp
//
//  Created by Oleg Leizer on 10/11/2017.
//  Copyright © 2017 idev.kz. All rights reserved.
//

import XCTest
@testable import HobbyApp

class ActivityModuleConfiguratorTests: XCTestCase {

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
        let viewController = ActivityViewControllerMock()
        let configurator = ActivityModuleConfigurator()

        //when
        configurator.configureModuleForViewInput(viewInput: viewController)

        //then
        XCTAssertNotNil(viewController.output, "ActivityViewController is nil after configuration")
        XCTAssertTrue(viewController.output is ActivityPresenter, "output is not ActivityPresenter")

        let presenter: ActivityPresenter = viewController.output as! ActivityPresenter
        XCTAssertNotNil(presenter.view, "view in ActivityPresenter is nil after configuration")
        XCTAssertNotNil(presenter.router, "router in ActivityPresenter is nil after configuration")
        XCTAssertTrue(presenter.router is ActivityRouter, "router is not ActivityRouter")

        let interactor: ActivityInteractor = presenter.interactor as! ActivityInteractor
        XCTAssertNotNil(interactor.output, "output in ActivityInteractor is nil after configuration")
    }

    class ActivityViewControllerMock: ActivityViewController {

        var setupInitialStateDidCall = false

        override func setupInitialState() {
            setupInitialStateDidCall = true
        }
    }
}
