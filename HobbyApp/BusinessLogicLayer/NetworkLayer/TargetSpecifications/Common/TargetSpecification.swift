//
//  TargetSpecification.swift
//  HobbyApp
//
//  Created by Олег Лейзер on 03.11.2017.
//  Copyright © 2017 Олег Лейзер. All rights reserved.
//

import Moya
protocol Fallible {
    associatedtype Error: NetworkError
}
protocol NetworkError: Swift.Error {
    static func error(from: MoyaError) -> Self
}

protocol TargetSpecification: TargetType {
    var defaultHeaders: [String: String] { get }
}
extension TargetSpecification {
    var defaultHeaders: [String: String] {
        let assigned: [String: String] = [
            "Accept": "application/json",
            //"Accept-Language": "",
            "Content-Type": "application/json",
            ]
        return assigned
    }
}

extension TargetType {
    var baseURL: URL {
        return URL(string: "B" )!
    }
    var sampleData: Data {
        return Data()
    }
    var task: Moya.Task {
        return .requestPlain
    }
//    var headers: [String : String]? {
//        return nil
//    }
    func stubbedData(_ filename: String) -> Data {
        let bundle = Bundle.main
        let path = bundle.path(forResource: filename, ofType: "json")
        return (try! Data(contentsOf: URL(fileURLWithPath: path!)))
    }
    var stubbedNetworkResponse: EndpointSampleResponse {
        switch self {
        default:
            return .networkResponse(200, sampleData)
        }
    }
    func headers() -> [String: String] {
        var assigned: [String: String] = [
            "Accept": "application/json",
            "Accept-Language": "",
            "Content-Type": "application/json",
            ]
        return assigned
    }
}

func url(_ route: Moya.TargetType) -> String {
    return route.baseURL.appendingPathComponent(route.path).absoluteString
}
