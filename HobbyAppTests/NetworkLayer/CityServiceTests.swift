//
//  CityServiceTests.swift
//  HobbyAppTests
//
//  Created by Олег Лейзер on 10.11.2017.
//  Copyright © 2017 Олег Лейзер. All rights reserved.
//

import XCTest
@testable import HobbyApp

class CityServiceTests: XCTestCase {
    var subject: CityService!
    override func setUp() {
        super.setUp()
        subject = CityService()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        let cities = subject.fetchAllCities()
        print(cities)
        
        
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
