//
//  CitySpecification.swift
//  HobbyApp
//
//  Created by Олег Лейзер on 03.11.2017.
//  Copyright © 2017 Олег Лейзер. All rights reserved.
//

import Moya

enum CitySpecification {
    case cityId(cityId: Int)
    //case editCity(cityId: Int, name: String)
    //case deleteCity(cityId: Int)
    case searchCity(keyword: String)
    case cities
    //case addCity
}

extension CitySpecification: TargetSpecification {
    var requiresToken: Bool {
        return false
    }

    //public var baseURL: URL { return URL(string: "http://test.mhbb.ru/b")! }
    var path: String {
        switch self {
        case .cityId(let cityId): return "/api/city/\(cityId)"
        //case .editCity(let cityId, _): return "/api/city/\(cityId)"
        //case .deleteCity(let cityId): return "/api/city/\(cityId)"
        case .searchCity: return "/api/city/search"
        case .cities: return "/api/city"
        //case .addCity: return "/api/city"
        }
    }
    var method: Moya.Method {
        switch self {
        case .cities, .cityId, .searchCity:
            return .get
//        case .addCity:
//            return .post
//        case .editCity:
//            return .put
//        case .deleteCity:
//            return .delete
//        default:
//            return .get
        }
    }
    var task: Task {
        return .requestPlain
    }
    var mappingType: MappingType {
        switch self {
        case .cities:
            return .city
        default:
            return .city
        }
    }
    var stubbedNetworkResponse: EndpointSampleResponse {
        switch self {
        default:
            return .networkResponse(200, sampleData)
        }
    }
    
    var sampleData: Data {
        switch self {
        case .cities:
            return stubbedData("cities")
        case .cityId:
            return stubbedData("city")
        case .searchCity:
            return stubbedData("cities")
        }
    }
    var headers: [String : String]? {
        return nil
    }
}

extension CitySpecification: Fallible {
    typealias Error = UserError

    enum UserError: NetworkError {
        case userNotFound

        static func error(from: MoyaError) -> UserError {
            switch from {
            case .underlying( _):
                return .userNotFound
            default:
                return .userNotFound
            }
        }

    }

}
