//
//  APIProviderErrors.swift
//  HobbyApp
//
//  Created by Олег Лейзер on 05.11.2017.
//  Copyright © 2017 Олег Лейзер. All rights reserved.
//

import Foundation
extension APIProvider {
    static func failedToMapObjects(_ failure: APIFailureCompletion) {
//        let jsonMappingError = ElloNetworkError(attrs: nil, code: ElloNetworkError.CodeType.unknown, detail: "NEED DEFAULT HERE", messages: nil, status: nil, title: "Unknown Error")
//        let elloError = NSError.networkError(jsonMappingError, code: ElloErrorCode.jsonMapping)
        failure(NSError(), nil)
    }
}
