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
    //case user(token: String)
    case user
    case changeUser(user: User)
//    case cityId(cityId: Int)
//    case editCity(cityId: Int, name: String)
//    case deleteCity(cityId: Int)
//    case searchCity(keyword: String)
//    case cities
//    case addCity
}

extension UserSpecification: TargetSpecification {
    //public var baseURL: URL { return URL(string: "http://test.mhbb.ru/b")! }
    var baseURL: URL {
        switch self {
        case .changeUser(let user):
            return URL(string: "http://test.mhbb.ru/b?email=\(user.email)")!
        default:
            return URL(string: "http://test.mhbb.ru/b" )!
        }
    }
    var path: String {
        switch self {
        case .createUser, .user: return "/api/user"
        case .changeUser(let user):
            return "/api/user"
        }
    }
    var method: Moya.Method {
        switch self {
        case .createUser:
            return .post
        case .user:
            return .get
        case .changeUser:
            return .put
        }
    }
    var task: Task {
        switch self {
        case .createUser(let email):
            return .requestParameters(parameters: ["email": email], encoding: JSONEncoding.default)
        case .user:
            return .requestPlain
        case .changeUser(let user):
            var parameters = [String: Any]()
            parameters["CityId"] = user.cityId
            parameters["Email"] = user.email
//            if let name = user.name {
//                parameters["Name"] = name
//            }
            return .requestParameters(parameters: parameters, encoding: JSONEncoding.prettyPrinted)


        }
    }
    var mappingType: MappingType {
        switch self {
        case .createUser, .user, .changeUser:
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
        case .user, .changeUser:
            return true
        }
    }
    var headers: [String : String]? {
        var assigned: [String: String] = [
            "Accept": "application/json",
            "Content-Type": "application/json",
            ]

        if self.requiresToken, let token = AuthToken().token {
            assigned["Authorization"] = "Token \(token)"
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
