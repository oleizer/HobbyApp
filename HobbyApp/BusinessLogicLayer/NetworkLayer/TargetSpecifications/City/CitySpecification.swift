//
//  CitySpecification.swift
//  HobbyApp
//
//  Created by Олег Лейзер on 03.11.2017.
//  Copyright © 2017 Олег Лейзер. All rights reserved.
//

import Moya

enum CitySpecification {
    case cities
    case cityId(cityId: Int)
}

extension CitySpecification: TargetSpecification {
    var headers: [String : String]? {
        return ["dd":"dd"]
    }
    

    
    var path: String {
        switch self {
        case .cities: return "/api/city"
        case .cityId(let cityId): return "/api/city/\(cityId)"
        }
    }
    
    var method: Method {
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
