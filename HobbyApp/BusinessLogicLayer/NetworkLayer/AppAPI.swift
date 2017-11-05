//
//  AppAPI.swift
//  HobbyApp
//
//  Created by Олег Лейзер on 05.11.2017.
//  Copyright © 2017 Олег Лейзер. All rights reserved.
//

import Moya
import Result

typealias MoyaResult = Result<Moya.Response, Moya.MoyaError>

indirect enum AppAPI {
    case cities
    case cityId(cityId: Int)

}

extension AppAPI: Moya.TargetType {
    var baseURL: URL { return URL(string: "http://test.mhbb.ru/b")! }
    
    
    var method: Moya.Method {
        switch self {
        case .cities, .cityId:
            return .get
        default:
            return .get
        }
    }
    var path: String {
        switch self {
        case .cities: return "/api/city"
        case .cityId(let cityId): return "/api/city/\(cityId)"
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
    var parameterEncoding: Moya.ParameterEncoding {
        if self.method == .get || self.method == .head {
            return URLEncoding.default
        }
        else {
            return JSONEncoding.default
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
    
    var headers: [String : String]? {
        var assigned: [String: String] = [
            "Accept": "application/json",
            "Accept-Language": "",
            "Content-Type": "application/json",
            ]
        return assigned
    }
    
 
    

//    var task: Task {
//        switch self {
//        case .cities:
//            return .requestParameters(parameters: ["hui": "hui"], encoding: JSONEncoding.default)
//        default:
//            return .requestParameters(parameters: ["hui": "hui"], encoding: JSONEncoding.default)
//        }
//
//    }

}
