//
//  InterestInterestViewTests.swift
//  HobbyApp
//
//  Created by Oleg Leizer on 09/11/2017.
//  Copyright © 2017 idev.kz. All rights reserved.
//

import XCTest
@testable import HobbyApp

class InterestViewTests: XCTestCase {

    private var view: InterestViewController?
    private var output: InterestViewOutputMock?

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        view = InterestViewController()
        output = InterestViewOutputMock()
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
    final class InterestViewOutputMock: InterestViewOutput {
        func viewIsReady() {
            viewIsReadyWasCalled = true

        }
        
        func object(atIndex index: Int) -> Interest {
            return Interest(id: 1, name: "2")
        }
        
        func numberOfRows() -> Int {
            return 1
        }
        
        var viewIsReadyWasCalled: Bool = false
    }
}
