//
//  XCTestCaseExtensions.swift
//  HobbyAppTests
//
//  Created by Олег Лейзер on 10.11.2017.
//  Copyright © 2017 Олег Лейзер. All rights reserved.
//
import XCTest
import Foundation
@testable import HobbyApp

extension XCTestCase {
    func stubbedJSONData(fileName: String) -> [String: Any] {
        let loadedData: Data = stubbedData(fileName)
        let json: Any = try! JSONSerialization.jsonObject(with: loadedData, options: [])
        return json as! [String : Any]
    }
    func stubbedJSONArray(fileName: String) -> [[String: Any]] {
        let loadedData: Data = stubbedData(fileName)
        let json: Any = try! JSONSerialization.jsonObject(with: loadedData, options: [])
        let result = json as! [[String: Any]]
        return result
    }
    
}
