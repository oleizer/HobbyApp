//
//  UserSpecification.swift
//  HobbyApp
//
//  Created by Олег Лейзер on 06.11.2017.
//  Copyright © 2017 Олег Лейзер. All rights reserved.
//

import Moya

enum UserSpecification {
    case createUser(email: String)
    case user(token: String)
//    case cityId(cityId: Int)
//    case editCity(cityId: Int, name: String)
//    case deleteCity(cityId: Int)
//    case searchCity(keyword: String)
//    case cities
//    case addCity
}

extension UserSpecification: TargetSpecification {
    //public var baseURL: URL { return URL(string: "http://test.mhbb.ru/b")! }
    var path: String {
        switch self {
        case .createUser: return "/api/user"
        case .user: return "/api/user"
        }
    }
    var method: Moya.Method {
        switch self {
        case .createUser:
            return .post
        case .user:
            return .get
        }
    }
    var task: Task {
        switch self {
        case .createUser(let email):
            return .requestParameters(parameters: ["email": email], encoding: JSONEncoding.default)
        case .user:
            return .requestPlain
        }
    }
    var mappingType: MappingType {
        switch self {
        case .createUser, .user:
            return .user
        }
    }
    //    var sampleData: Data {
    //        switch self {
    //        case .cities:
    //            return stubbedData("cities")
    //        case .cityId:
    //            return stubbedData("city")
    //        }
    //    }
    var requiresToken: Bool {
        switch self {
        case .createUser:
            return false
        case .user:
            return true
        }
    }
    var headers: [String : String]? {
        var assigned: [String: String] = [
            "Accept": "application/json",
            //"Accept-Language": "",
            "Content-Type": "application/json",
            ]
        
        if self.requiresToken, let token = AuthToken().token {
            assigned["Authorization"] = "Token \(token)"
            //assigned += "Token "
        }
        return assigned
    }
}
//
extension UserSpecification: Fallible {
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
