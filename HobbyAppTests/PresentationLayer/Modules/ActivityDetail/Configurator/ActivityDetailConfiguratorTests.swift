//
//  ActivityDetailActivityDetailConfiguratorTests.swift
//  HobbyApp
//
//  Created by Oleg Leizer on 10/11/2017.
//  Copyright © 2017 idev.kz. All rights reserved.
//

import XCTest
@testable import HobbyApp

class ActivityDetailModuleConfiguratorTests: XCTestCase {

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
        let viewController = ActivityDetailViewControllerMock()
        let configurator = ActivityDetailModuleConfigurator()

        //when
        configurator.configureModuleForViewInput(viewInput: viewController)

        //then
        XCTAssertNotNil(viewController.output, "ActivityDetailViewController is nil after configuration")
        XCTAssertTrue(viewController.output is ActivityDetailPresenter, "output is not ActivityDetailPresenter")

        let presenter: ActivityDetailPresenter = viewController.output as! ActivityDetailPresenter
        XCTAssertNotNil(presenter.view, "view in ActivityDetailPresenter is nil after configuration")
        XCTAssertNotNil(presenter.router, "router in ActivityDetailPresenter is nil after configuration")
        XCTAssertTrue(presenter.router is ActivityDetailRouter, "router is not ActivityDetailRouter")

        let interactor: ActivityDetailInteractor = presenter.interactor as! ActivityDetailInteractor
        XCTAssertNotNil(interactor.output, "output in ActivityDetailInteractor is nil after configuration")
    }

    class ActivityDetailViewControllerMock: ActivityDetailViewController {

        var setupInitialStateDidCall = false

        override func setupInitialState() {
            setupInitialStateDidCall = true
        }
    }
}
