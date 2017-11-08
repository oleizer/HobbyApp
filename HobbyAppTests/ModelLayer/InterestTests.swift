//
//  InterestTests.swift
//  HobbyAppTests
//
//  Created by Олег Лейзер on 07.11.2017.
//  Copyright © 2017 Олег Лейзер. All rights reserved.
//

import XCTest
@testable import HobbyApp

class InterestTests: XCTestCase {
    
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
            "Name": "Interest"
        ]
        let interest: Interest = Interest.fromJSON(data) as! Interest
        XCTAssertNotNil(interest)
        XCTAssertEqual(interest.name, "Interest")
        XCTAssertEqual(interest.id, "1")
    }
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
