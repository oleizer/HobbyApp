//
//  CitySpecificationTests.swift
//  HobbyAppTests
//
//  Created by Олег Лейзер on 06.11.2017.
//  Copyright © 2017 Олег Лейзер. All rights reserved.
//

import XCTest
@testable import HobbyApp

class CitySpecificationTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testPaths() {
        let expectations: [(CitySpecification, String)] = [
            (.cityId(cityId: 1), "/api/city/1"),
            //(.editCity(cityId: 1, name: "foo"), "/api/city/1"),
            //(.deleteCity(cityId: 1), "/api/city/1"),
            (.searchCity(keyword: "foo"), "/api/city/search"),
            (.cities, "/api/city"),
            //(.addCity, "/api/city"),
            ]
        for (api, path) in expectations {
            XCTAssertEqual(api.path, path)
        }
    }
}
