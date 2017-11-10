//
//  ActivityTests.swift
//  HobbyAppTests
//
//  Created by Олег Лейзер on 09.11.2017.
//  Copyright © 2017 Олег Лейзер. All rights reserved.
//

import XCTest
@testable import HobbyApp

class ActivityTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    func testParseJSON() {
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
        XCTAssertNotNil(model)
        XCTAssertEqual(model.name, "Name")
        XCTAssertEqual(model.id, 1)
        XCTAssertEqual(model.detail, "Description")

        
        XCTAssertEqual(model.ageFrom, 2)
        XCTAssertEqual(model.ageTo, 33)
        XCTAssertEqual(model.free, false)

        
    }
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
