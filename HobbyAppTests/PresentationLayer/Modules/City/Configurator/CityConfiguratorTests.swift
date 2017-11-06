//
//  CityCityConfiguratorTests.swift
//  HobbyApp
//
//  Created by Oleg Leizer on 03/11/2017.
//  Copyright © 2017 idev.kz. All rights reserved.
//

import XCTest
@testable import HobbyApp

class CityModuleConfiguratorTests: XCTestCase {

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
        let viewController = CityViewControllerMock()
        let configurator = CityModuleConfigurator()

        //when
        configurator.configureModuleForViewInput(viewInput: viewController)

        //then
        XCTAssertNotNil(viewController.output, "CityViewController is nil after configuration")
        XCTAssertTrue(viewController.output is CityPresenter, "output is not CityPresenter")

        let presenter: CityPresenter = viewController.output as! CityPresenter
        XCTAssertNotNil(presenter.view, "view in CityPresenter is nil after configuration")
        XCTAssertNotNil(presenter.router, "router in CityPresenter is nil after configuration")
        XCTAssertTrue(presenter.router is CityRouter, "router is not CityRouter")

        let interactor: CityInteractor = presenter.interactor as! CityInteractor
        XCTAssertNotNil(interactor.output, "output in CityInteractor is nil after configuration")
    }

    class CityViewControllerMock: CityViewController {

        var setupInitialStateDidCall = false

        override func setupInitialState() {
            setupInitialStateDidCall = true
        }
    }
}
