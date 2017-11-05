//
//  AppAPI.swift
//  HobbyApp
//
//  Created by Олег Лейзер on 05.11.2017.
//  Copyright © 2017 Олег Лейзер. All rights reserved.
//

import Moya
import Result

indirect enum AppAPI {
    case cities
    case cityId(cityId: Int)

}

extension AppAPI: Moya.TargetType {
    var headers: [String : String]? {
        var assigned: [String: String] = [
            "Accept": "application/json",
            "Accept-Language": "",
            "Content-Type": "application/json",
            ]
        return assigned
    }
    
    var path: String {
        switch self {
        case .cities: return "/api/city"
        case .cityId(let cityId): return "/api/city/\(cityId)"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .cities, .cityId:
            return .get
        default:
            return .get
        }
    }
    var task: Task {
        switch self {
        case .cities:
            return .requestParameters(parameters: ["hui": "hui"], encoding: JSONEncoding.default)
        default:
            return .requestParameters(parameters: ["hui": "hui"], encoding: JSONEncoding.default)
        }
        
    }
    var sampleData: Data {
        switch self {
        case .cities:
            return stubbedData("cities")
        case .cityId:
            return stubbedData("city")
        }
    }
}
