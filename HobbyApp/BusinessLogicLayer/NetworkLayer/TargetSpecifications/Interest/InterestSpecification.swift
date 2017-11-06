//
//  InterestSpecification.swift
//  HobbyApp
//
//  Created by Олег Лейзер on 06.11.2017.
//  Copyright © 2017 Олег Лейзер. All rights reserved.
//

import Moya

enum InterestSpecification {
    case interests
    case interestId(interestId: Int)
    case editInterest(interestId: Int, name: String)
    case addInterest
    case deleteInterest(interestId: Int)
}

extension InterestSpecification: TargetSpecification {
    var requiresToken: Bool {
        return false
    }
    
    //public var baseURL: URL { return URL(string: "http://test.mhbb.ru/b")! }
    var path: String {
        switch self {
        case .interestId(let interestId): return "/api/interest/\(interestId)"
        case .editInterest(let interestId): return "/api/interest/\(interestId)"
        case .deleteInterest(let interestId): return "/api/interest/\(interestId)"
        case .interests: return "/api/interest/getall"
        case .addInterest: return "/api/interest"
        }
    }
    var method: Moya.Method {
        switch self {
        case .interests, .interestId:
            return .get
        case .addInterest:
            return .post
        case .editInterest:
            return .put
        case .deleteInterest:
            return .delete
//        default:
//            return .get
        }
    }
    var task: Task {
        return .requestPlain
    }
    var mappingType: MappingType {
        switch self {
        case .interests:
            return .errorType
        default:
            return .errorType
        }
    }
    //    var sampleData: Data {
    //        switch self {
    //        case .cities:
    //            return stubbedData("cities")
    //        case .interestId:
    //            return stubbedData("interest")
    //        }
    //    }
    var headers: [String : String]? {
        return nil
    }
}
//
extension InterestSpecification: Fallible {
    typealias Error = UserError
    
    enum UserError: NetworkError {
        case userNotFound
        
        static func error(from: MoyaError) -> UserError {
            switch from {
            case .underlying(_):
                return .userNotFound
            default:
                return .userNotFound
            }
        }
        
    }
    
}
