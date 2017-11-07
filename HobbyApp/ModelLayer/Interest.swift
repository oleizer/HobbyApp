//
//  Interest.swift
//  HobbyApp
//
//  Created by Олег Лейзер on 06.11.2017.
//  Copyright © 2017 Олег Лейзер. All rights reserved.
//

import Foundation
import SwiftyJSON

// Version 1: init
let InterestVersion = 1

final class Interest: JSONAble {
    let id: String
    let name: String
    init(id: String,
         name: String)
    {
        self.id = id
        self.name = name
        super.init(version: CityVersion)
    }

    required init(coder: NSCoder) {
        let decoder = Coder(coder)
        id = decoder.decodeKey("id")
        name = decoder.decodeKey("name")
        super.init(coder: coder)
    }

    override func encode(with coder: NSCoder) {
        let encoder = Coder(coder)
        encoder.encodeObject(id, forKey: "id")
        encoder.encodeObject(name, forKey: "name")
        super.encode(with: coder)
    }
    override class func fromJSON(_ data: [String: Any]) -> JSONAble {
        let json = JSON(data)
        let id = json["Id"].stringValue
        let name = json["Name"].stringValue
        let interest = Interest(id: id, name: name)
        return interest
    }
}
