//
//  NetworkError.swift
//  HobbyApp
//
//  Created by Олег Лейзер on 05.11.2017.
//  Copyright © 2017 Олег Лейзер. All rights reserved.
//

import Foundation
let AppErrorDomain = "kz.idev.HobbyApp"

enum AppErrorCode: Int {
    case imageMapping = 0
    case jsonMapping
    case stringMapping
    case statusCode
    case data
    case networkFailure
}

extension NSError {

    class func networkError(_ error: Any?, code: AppErrorCode) -> NSError {
        var userInfo: [String: Any]?
        if let error: Any = error {
            userInfo = [NSLocalizedFailureReasonErrorKey: error]
        }
        return NSError(domain: AppErrorDomain, code: code.rawValue, userInfo: userInfo)
    }

}
