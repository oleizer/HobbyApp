//
//  User.swift
//  HobbyApp
//
//  Created by Олег Лейзер on 06.11.2017.
//  Copyright © 2017 Олег Лейзер. All rights reserved.
//


import Foundation
import SwiftyJSON

// Version 1: init
let UserVersion = 1

final class User: JSONAble {
    let id: Int
    let name: String
    let roleName: String
    let cityId: Int
    let phone: String
    let cityName: String
    let email: String
    init(id: Int,
         name: String,
         roleName: String,
         cityId: Int,
         phone: String,
         cityName: String,
         email: String
         )
    {
        self.id = id
        self.name = name
        self.roleName = roleName
        self.cityId = cityId
        self.phone = phone
        self.cityName = cityName
        self.email = email
        super.init(version: CityVersion)
    }
    
    required init(coder: NSCoder) {
        let decoder = Coder(coder)
        id = decoder.decodeKey("id")
        name = decoder.decodeKey("name")
        roleName = decoder.decodeKey("roleName")
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
        encoder.encodeObject(roleName, forKey: "roleName")
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
        
        let roleName = json["RoleName"].stringValue
        let cityId = json["CityId"].intValue
        let phone = json["Phone"].stringValue
        let cityName = json["CityName"].stringValue
        let email = json["Email"].stringValue

        let user = User(id: id, name: name, roleName: roleName, cityId: cityId, phone: phone, cityName: cityName, email: email)
        return user
    }
}
