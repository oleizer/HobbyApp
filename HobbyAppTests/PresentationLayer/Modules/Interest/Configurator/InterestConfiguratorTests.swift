//
//  InterestInterestConfiguratorTests.swift
//  HobbyApp
//
//  Created by Oleg Leizer on 09/11/2017.
//  Copyright © 2017 idev.kz. All rights reserved.
//

import XCTest
@testable import HobbyApp

class InterestModuleConfiguratorTests: XCTestCase {

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
        let viewController = InterestViewControllerMock()
        let configurator = InterestModuleConfigurator()

        //when
        configurator.configureModuleForViewInput(viewInput: viewController)

        //then
        XCTAssertNotNil(viewController.output, "InterestViewController is nil after configuration")
        XCTAssertTrue(viewController.output is InterestPresenter, "output is not InterestPresenter")

        let presenter: InterestPresenter = viewController.output as! InterestPresenter
        XCTAssertNotNil(presenter.view, "view in InterestPresenter is nil after configuration")
        XCTAssertNotNil(presenter.router, "router in InterestPresenter is nil after configuration")
        XCTAssertTrue(presenter.router is InterestRouter, "router is not InterestRouter")

        let interactor: InterestInteractor = presenter.interactor as! InterestInteractor
        XCTAssertNotNil(interactor.output, "output in InterestInteractor is nil after configuration")
    }

    class InterestViewControllerMock: InterestViewController {

        var setupInitialStateDidCall = false

        override func setupInitialState() {
            setupInitialStateDidCall = true
        }
    }
}
