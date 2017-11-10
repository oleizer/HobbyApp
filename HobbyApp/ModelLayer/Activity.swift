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
    let organizer: Organizer
    let picture: Picture
    init(id: Int,
         name: String,
         detail: String,
         voices: Int,
         ageFrom: Int,
         ageTo: Int,
         organizer: Organizer,
         picture: Picture,

         free: Bool) {
        self.id = id
        self.name = name
        self.detail = detail
        self.voices = voices
        self.ageFrom = ageFrom
        self.ageTo = ageTo
        self.free = free
        self.organizer = organizer
        self.picture = picture

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
        organizer = decoder.decodeKey("organizer")
        picture = decoder.decodeKey("picture")

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
        encoder.encodeObject(organizer, forKey: "organizer")
        encoder.encodeObject(picture, forKey: "picture")

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
        let org = json["Organizer"].dictionaryValue
        let organizer = Organizer.fromJSON(org) as! Organizer
        let pic = json["MainPicture"].dictionaryValue
        let picture = Picture.fromJSON(pic) as! Picture
        let result = Activity(id: id, name: name, detail: detail, voices: voices, ageFrom: ageFrom, ageTo: ageTo, organizer: organizer, picture: picture, free: free)
        return result
    }
}

final class Picture: JSONAble {
    let id: Int
    let url: String
    let isMain: Bool
    init(id: Int,
         url: String,
         isMain: Bool
        )
    {
        self.id = id
        self.url = url
        self.isMain = isMain
        super.init(version: ActivityVersion)
    }

    required init(coder: NSCoder) {
        let decoder = Coder(coder)
        id = decoder.decodeKey("id")
        url = decoder.decodeKey("url")
        isMain = decoder.decodeKey("isMain")
        super.init(coder: coder)
    }

    override func encode(with coder: NSCoder) {
        let encoder = Coder(coder)
        encoder.encodeObject(id, forKey: "id")
        encoder.encodeObject(url, forKey: "url")
        encoder.encodeObject(isMain, forKey: "isMain")
        super.encode(with: coder)
    }
    override class func fromJSON(_ data: [String: Any]) -> JSONAble {
        let json = JSON(data)
        let id = json["Id"].intValue
        let url = json["Url"].stringValue
        let isMain = json["IsMain"].boolValue
        let result = Picture(id: id, url: url, isMain: isMain)
        return result
    }
}
final class Organizer: JSONAble {
    let id: Int
    var name: String
    var cityId: Int
    var cityName: String
    var phone: String
    let sobriety: String
    let email: String
    init(id: Int,
         name: String,
         cityId: Int,
         phone: String,
         cityName: String,
         sobriety: String,
         email: String
        )
    {
        self.id = id
        self.name = name
        self.sobriety = sobriety
        self.cityId = cityId
        self.phone = phone
        self.cityName = cityName
        self.email = email
        super.init(version: ActivityVersion)
    }

    required init(coder: NSCoder) {
        let decoder = Coder(coder)
        id = decoder.decodeKey("id")
        name = decoder.decodeKey("name")
        sobriety = decoder.decodeKey("sobriety")
        cityId = decoder.decodeKey("cityId")
        phone = decoder.decodeKey("phone")
        cityName = decoder.decodeKey("cityName")
        email = decoder.decodeKey("email")

        super.init(coder: coder)
    }

    override func encode(with coder: NSCoder) {
        let encoder = Coder(coder)
        encoder.encodeObject(id, forKey: "id")
        encoder.encodeObject(name, forKey: "name")
        encoder.encodeObject(sobriety, forKey: "sobriety")
        encoder.encodeObject(cityId, forKey: "cityId")
        encoder.encodeObject(phone, forKey: "phone")
        encoder.encodeObject(cityName, forKey: "cityName")
        encoder.encodeObject(email, forKey: "email")

        super.encode(with: coder)
    }
    override class func fromJSON(_ data: [String: Any]) -> JSONAble {
        let json = JSON(data)
        let id = json["Id"].intValue
        let name = json["Name"].stringValue

        let sobriety = json["Sobriety"].stringValue
        let cityId = json["CityId"].intValue
        let phone = json["Phone"].stringValue
        let cityName = json["CityName"].stringValue
        let email = json["Email"].stringValue

        let result = Organizer(id: id, name: name, cityId: cityId, phone: phone, cityName: cityName, sobriety: sobriety, email: email)
        return result
    }
}
