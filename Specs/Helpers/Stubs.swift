//
//  Stubs.swift
//  Specs
//
//  Created by Олег Лейзер on 12.11.2017.
//  Copyright © 2017 Олег Лейзер. All rights reserved.
//

import Foundation
@testable import HobbyApp
func stub<T: Stubbable>(_ values: [String: Any]) -> T {
    return T.stub(values)
}
protocol Stubbable: NSObjectProtocol {
    static func stub(_ values: [String: Any]) -> Self
}
extension City: Stubbable {
    class func stub(_ values: [String : Any]) -> City {
        let id = 22
        let name = "Караганда"
        let data: [String: Any] = [
            "Id": id,
            "Name": name
        ]
        let result = City.fromJSON(data) as! City
        return result
    }
}
