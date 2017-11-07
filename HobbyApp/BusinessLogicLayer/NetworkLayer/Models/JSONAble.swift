//
//  JSONAble.swift
//  HobbyApp
//
//  Created by Олег Лейзер on 05.11.2017.
//  Copyright © 2017 Олег Лейзер. All rights reserved.
//

import Foundation

let JSONAbleVersion = 1
protocol JSONSaveable {
    var uniqueId: String? { get }
    var tableId: String? { get }
}
class JSONAble: NSObject, NSCoding {
    let version: Int

    init(version: Int) {
        self.version = version
        super.init()
    }

    required init(coder: NSCoder) {
        let decoder = Coder(coder)

        self.version = decoder.decodeKey("version")
    }

    func encode(with encoder: NSCoder) {
        let coder = Coder(encoder)

        coder.encodeObject(version, forKey: "version")
    }

    class func fromJSON(_ data: [String: Any]) -> JSONAble {
        return JSONAble(version: JSONAbleVersion)
    }
}
