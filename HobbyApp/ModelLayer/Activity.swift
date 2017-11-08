//
//  Activity.swift
//  HobbyApp
//
//  Created by Олег Лейзер on 09.11.2017.
//  Copyright © 2017 Олег Лейзер. All rights reserved.
//

import Foundation
import SwiftyJSON

// Version 1: init
let ActivityVersion = 1

final class Activity: JSONAble {
    let id: Int
    let name: String
    let detail: String
    let voices: Int
    let ageFrom: Int
    let ageTo: Int
    let free: Bool
    init(id: Int,
         name: String,
         detail: String,
         voices: Int,
         ageFrom: Int,
         ageTo: Int,
         free: Bool) {
        self.id = id
        self.name = name
        self.detail = detail
        self.voices = voices
        self.ageFrom = ageFrom
        self.ageTo = ageTo
        self.free = free
        super.init(version: ActivityVersion)
    }
    
    required init(coder: NSCoder) {
        let decoder = Coder(coder)
        id = decoder.decodeKey("id")
        name = decoder.decodeKey("name")
        detail = decoder.decodeKey("detail")
        voices = decoder.decodeKey("voices")
        ageFrom = decoder.decodeKey("ageFrom")
        ageTo = decoder.decodeKey("ageTo")
        free = decoder.decodeKey("free")

        super.init(coder: coder)
    }
    
    override func encode(with coder: NSCoder) {
        let encoder = Coder(coder)
        encoder.encodeObject(id, forKey: "id")
        encoder.encodeObject(name, forKey: "name")
        encoder.encodeObject(detail, forKey: "detail")
        encoder.encodeObject(voices, forKey: "voices")
        encoder.encodeObject(ageFrom, forKey: "ageFrom")
        encoder.encodeObject(ageTo, forKey: "ageTo")
        encoder.encodeObject(free, forKey: "free")
        super.encode(with: coder)
    }
    override class func fromJSON(_ data: [String: Any]) -> JSONAble {
        let json = JSON(data)
        let id = json["Id"].intValue
        let name = json["Name"].stringValue
        let detail = json["Description"].stringValue
        let voices = json["Voices"].intValue
        let ageFrom = json["AgeFrom"].intValue
        let ageTo = json["AgeTo"].intValue
        let free = json["Free"].boolValue
        let result = Activity(id: id, name: name, detail: detail, voices: voices, ageFrom: ageFrom, ageTo: ageTo, free: free)
        return result
    }
}
