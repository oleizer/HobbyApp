//
//  ActivitySpecifications.swift
//  HobbyApp
//
//  Created by Олег Лейзер on 09.11.2017.
//  Copyright © 2017 Олег Лейзер. All rights reserved.
//
import Moya

enum ActivitySpecification {
    case search(params: [String: Any])
}

extension ActivitySpecification: TargetSpecification {
    var requiresToken: Bool {
        return false
    }

    var path: String {
        switch self {
        case .search:
//            var path: String = "/activity/search"
//            if let cityId = param["cityID"] {
//                path.append("cityId=\(cityId)")
//            }
            return "/api/activity/search"
        }
    }
    var method: Moya.Method {
        switch self {
        case .search:
            return .get
        }
    }
    var task: Task {
        switch self {
        case .search(let params):
            return .requestParameters(parameters: params, encoding: URLEncoding.default)
        }
    }
    var mappingType: MappingType {
        switch self {
        case .search:
            return .activity
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
    var headers: [String : String]? {
        return nil
    }
}
//
extension ActivitySpecification: Fallible {
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
