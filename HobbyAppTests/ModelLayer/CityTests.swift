//
//  CityTests.swift
//  HobbyAppTests
//
//  Created by Олег Лейзер on 06.11.2017.
//  Copyright © 2017 Олег Лейзер. All rights reserved.
//

import XCTest
@testable import HobbyApp

class CityTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testParseJSONArray() {
        let citiesRaw = stubbedJSONArray(fileName: "cities")
        XCTAssert(citiesRaw.count > 0)
        
        let cityRaw: [String: Any] = citiesRaw.first!
        let city: City = City.fromJSON(cityRaw) as! City
        XCTAssertNotNil(city)
    }
    func testParseJSON() {
        let id = 22
        let name = "Karaganda"
        let data: [String: Any] = [
            "Id": id,
            "Name": name
        ]
        let city: City = City.fromJSON(data) as! City
        XCTAssertNotNil(city)
        XCTAssertEqual(city.name, name)
        XCTAssertEqual(city.id, id)
    }
}
