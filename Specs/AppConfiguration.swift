//
//  AppConfiguration.swift
//  Specs
//
//  Created by Олег Лейзер on 12.11.2017.
//  Copyright © 2017 Олег Лейзер. All rights reserved.
//

@testable import HobbyApp
import Quick
import Nimble_Snapshots
import PromiseKit

class AppConfiguration: QuickConfiguration {
    
}

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
