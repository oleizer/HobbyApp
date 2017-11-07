//
//  APIProviderErrors.swift
//  HobbyApp
//
//  Created by Олег Лейзер on 05.11.2017.
//  Copyright © 2017 Олег Лейзер. All rights reserved.
//

import Foundation

extension APIProvider {
    static func unCastableJSONAble(_ failure: APIFailureCompletion) {
        let appError = NSError.uncastableJSONAble()
        failure(appError, 200)
    }
    static func generateAppError(_ data: Data?, statusCode: Int?) -> NSError {
        var appNetworkError: AppNetworkError?
        
        if let data = data {
            let (mappedJSON, _): (Any?, NSError?) = Mapper.mapJSON(data)
            let dictJSON = mappedJSON as? [String: Any]
            
            if dictJSON != nil {
                if let node = dictJSON?[MappingType.errorsType.rawValue] as? [String: Any] {
                    appNetworkError = Mapper.mapToObject(node, type: MappingType.errorType) as? AppNetworkError
                }else if let node = dictJSON {
                    
                }
            }
        }
        else if statusCode == 401 {
            appNetworkError = AppNetworkError(attrs: nil, code: .unauthenticated, detail: nil, messages: nil, status: "401", title: "unauthenticated")
        }
        
        let errorCodeType = (statusCode == nil) ? AppErrorCode.data : AppErrorCode.statusCode
        let appError = NSError.networkError(appNetworkError, code: errorCodeType)
        
        return appError
    }
    static func failedToSendRequest(_ failure: APIFailureCompletion) {
        let appError = NSError.networkError("Failed to send request", code: AppErrorCode.networkFailure)
        failure(appError, nil)
    }
    static func failedToMapObjects(_ failure: APIFailureCompletion) {
        let jsonMappingError = AppNetworkError(attrs: nil, code: AppNetworkError.CodeType.unknown, detail: "NEED DEFAULT HERE", messages: nil, status: nil, title: "Unknown Error")
        let appError = NSError.networkError(jsonMappingError, code: AppErrorCode.jsonMapping)
//        let jsonMappingError = ElloNetworkError(attrs: nil, code: ElloNetworkError.CodeType.unknown, detail: "NEED DEFAULT HERE", messages: nil, status: nil, title: "Unknown Error")
//        let elloError = NSError.networkError(jsonMappingError, code: ElloErrorCode.jsonMapping)
        failure(appError, nil)
    }
}
