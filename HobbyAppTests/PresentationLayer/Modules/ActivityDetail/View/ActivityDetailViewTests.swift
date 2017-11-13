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

        func viewIsReady() {
            viewIsReadyWasCalled = true
        }
        
        func numberOfSections() -> Int {
            return 0
        }
        
        func numberOfRows(inSection section: Int) -> Int {
            return 0
        }
        
        func sectionType(inSection section: Int) -> SectionType {
            return .header
        }
        
        func infoRowType(inRow row: Int) -> InfoRowType {
            return .organizer
        }
        
        func getActivity() -> Activity {
            let data: [String: Any] = [
                "Id": 1,
                "Name": "Name",
                "Description": "Description",
                "Voices": 2,
                "AgeFrom": 2,
                "AgeTo": 33,
                "Free": false,
                "MainPicture": [
                    "Id": 122,
                    "url": "http://test.mhbb.ru/b/api/picture/112",
                    "IsMain": true,
                ],
                "Organizer": [
                    "Id": 1,
                    "Name": "Name",
                    "CityId": 1,
                    "City": "City",
                    "Sobriety": true,
                    "Email": "email@email.ri",
                    "Phone": "77013875885",
                ]
            ]
            let model: Activity = Activity.fromJSON(data) as! Activity
            return model
        }
        

    }
}
