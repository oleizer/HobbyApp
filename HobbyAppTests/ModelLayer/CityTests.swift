//
//  CityTests.swift
//  HobbyAppTests
//
//  Created by Олег Лейзер on 06.11.2017.
//  Copyright © 2017 Олег Лейзер. All rights reserved.
//

import XCTest

class CityTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    func testParseJSON() {
        let data: [String: Any] = [
            "Id": "1",
            "Name": "City"
        ]
        let city: City = City.fromJSON(data) as! City
        XCTAssertNotNil(city)
        XCTAssertEqual(city.name, "City")
        XCTAssertEqual(city.id, "1")
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
