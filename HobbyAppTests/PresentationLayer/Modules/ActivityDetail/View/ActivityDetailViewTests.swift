//
//  ActivityDetailActivityDetailViewTests.swift
//  HobbyApp
//
//  Created by Oleg Leizer on 10/11/2017.
//  Copyright © 2017 idev.kz. All rights reserved.
//

import XCTest
@testable import HobbyApp

class ActivityDetailViewTests: XCTestCase {

    private var view: ActivityDetailViewController?
    private var output: ActivityDetailViewOutputMock?

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        view = ActivityDetailViewController()
        output = ActivityDetailViewOutputMock()
        view?.output = output
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    func testThatViewNotifiesPresenterOnDidLoad() {
        // when
        self.view?.viewDidLoad()
        // then
        XCTAssert(self.output?.viewIsReadyWasCalled == true)
    }
    final class ActivityDetailViewOutputMock: ActivityDetailViewOutput {
        var viewIsReadyWasCalled: Bool = false

        func viewIsReadyWasCalled() {
            viewIsReadyWasCalled = true
        }
    }
}
