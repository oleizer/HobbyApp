//
//  MappingType.swift
//  HobbyApp
//
//  Created by Олег Лейзер on 05.11.2017.
//  Copyright © 2017 Олег Лейзер. All rights reserved.
//

import Foundation
typealias FromJSONClosure = ([String: Any]) -> JSONAble

enum MappingType: String {
    case errorType = "error"
    case noContentType = "204"
    case user = "user"
    var fromJSON: FromJSONClosure {
        switch self {
        case .user:
            return User.fromJSON
        case .noContentType:
            return UnknownJSONAble.fromJSON
        case .errorType:
            return City.fromJSON
        }
    }
}
let UnknownJSONAbleVersion = 1

class UnknownJSONAble: JSONAble {
    convenience init() {
        self.init(version: UnknownJSONAbleVersion)
    }
    
    override class func fromJSON(_ data: [String: Any]) -> JSONAble {
        return UnknownJSONAble()
    }
}
