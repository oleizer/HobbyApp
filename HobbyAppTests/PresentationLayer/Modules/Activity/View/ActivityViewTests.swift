//
//  ActivityActivityViewTests.swift
//  HobbyApp
//
//  Created by Oleg Leizer on 10/11/2017.
//  Copyright © 2017 idev.kz. All rights reserved.
//

import XCTest
@testable import HobbyApp

class ActivityViewTests: XCTestCase {

    private var view: ActivityViewController?
    private var output: ActivityViewOutputMock?

    override func setUp() {
        super.setUp()
        view = ActivityViewController()
        output = ActivityViewOutputMock()
        view?.output = output
    }

    override func tearDown() {
        super.tearDown()
    }
    
    func testThatViewNotifiesPresenterOnDidLoad() {
        // when
        self.view?.viewDidLoad()
        // then
        XCTAssert(self.output?.viewIsReadyWasCalled == true)
    }
    final class ActivityViewOutputMock: ActivityViewOutput {
        var viewIsReadyWasCalled: Bool = false

        func viewIsReady() {
            viewIsReadyWasCalled = true
        }
        
        func object(atIndex index: Int) -> Activity {
            let pic: [String: Any] = [
                "Id": 122,
                "url": "http://test.mhbb.ru/b/api/picture/112",
                "IsMain": true,
                ]
            let org: [String: Any] = [
                "Id": 1,
                "Name": "Name",
                "CityId": 1,
                "City": "City",
                "Sobriety": true,
                "Email": "email@email.ri",
                "Phone": "77013875885",
                ]
            let data: [String: Any] = [
                "Id": 1,
                "Name": "Name",
                "Description": "Description",
                "Voices": 2,
                "AgeFrom": 2,
                "AgeTo": 33,
                "Free": false,
                "Organizer": org
            ]
            let model: Activity = Activity.fromJSON(data) as! Activity
            return model
        }
        
        func numberOfRows() -> Int {
            return 1
        }
        
    }
}
