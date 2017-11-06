//
//  AddCityAddCityConfiguratorTests.swift
//  HobbyApp
//
//  Created by Oleg Leizer on 06/11/2017.
//  Copyright © 2017 idev.kz. All rights reserved.
//

import XCTest

class AddCityModuleConfiguratorTests: XCTestCase {

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
        let viewController = AddCityViewControllerMock()
        let configurator = AddCityModuleConfigurator()

        //when
        configurator.configureModuleForViewInput(viewInput: viewController)

        //then
        XCTAssertNotNil(viewController.output, "AddCityViewController is nil after configuration")
        XCTAssertTrue(viewController.output is AddCityPresenter, "output is not AddCityPresenter")

        let presenter: AddCityPresenter = viewController.output as! AddCityPresenter
        XCTAssertNotNil(presenter.view, "view in AddCityPresenter is nil after configuration")
        XCTAssertNotNil(presenter.router, "router in AddCityPresenter is nil after configuration")
        XCTAssertTrue(presenter.router is AddCityRouter, "router is not AddCityRouter")

        let interactor: AddCityInteractor = presenter.interactor as! AddCityInteractor
        XCTAssertNotNil(interactor.output, "output in AddCityInteractor is nil after configuration")
    }

    class AddCityViewControllerMock: AddCityViewController {

        var setupInitialStateDidCall = false

        override func setupInitialState() {
            setupInitialStateDidCall = true
        }
    }
}
