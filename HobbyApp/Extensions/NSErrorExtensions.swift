//
//  NSErrorExtensions.swift
//  HobbyApp
//
//  Created by Олег Лейзер on 07.11.2017.
//  Copyright © 2017 Олег Лейзер. All rights reserved.
//

import Foundation
extension NSError {
    var appError: AppNetworkError? {
        return userInfo[NSLocalizedFailureReasonErrorKey] as? AppNetworkError
    }
    
    static func uncastableJSONAble() -> NSError {
        return NSError.networkError(nil, code: AppErrorCode.jsonMapping)
    }
}

extension Error {
    var appErrorMessage: String? {
        let error = self as NSError
        if let appError = error.appError {
            return appError.title
        }
        if let reason = error.userInfo[NSLocalizedFailureReasonErrorKey] as? String {
            return reason
        }
        return nil
    }
}
