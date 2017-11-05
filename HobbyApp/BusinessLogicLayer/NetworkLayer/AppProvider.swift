//
//  AppProvider.swift
//  HobbyApp
//
//  Created by Олег Лейзер on 03.11.2017.
//  Copyright © 2017 Олег Лейзер. All rights reserved.
//

import Moya
import Result
import Alamofire
import PromiseKit
typealias APIResponse = (Any)

typealias RequestClosure = (target: AppAPI, success: SuccessCompletion, failure: FailureCompletion)

typealias SuccessCompletion = (Any) -> Void
typealias FailureCompletion = (NSError, Int?) -> Void


class AppProvider {
    static var shared: AppProvider = AppProvider()
    
    static func endpointClosure(_ target: AppAPI) -> Endpoint<AppAPI> {
        let endpoint = Endpoint<AppAPI>(url: url(target), sampleResponseClosure: { () -> EndpointSampleResponse in
            return target.stubbedNetworkResponse
        }, method: target.method, task: target.task, httpHeaderFields: target.headers())
        
        return endpoint
    }
    static func DefaultProvider() -> MoyaProvider<AppAPI> {
        return MoyaProvider<AppAPI>(endpointClosure: AppProvider.endpointClosure, manager: AppManager.manager)
    }

    private struct SharedProvider {
        static var instance = AppProvider.DefaultProvider()
    }
    static var oneTimeProvider: MoyaProvider<AppAPI>?
    static var sharedProvider: MoyaProvider<AppAPI> {
        get {
            if let provider = oneTimeProvider {
                oneTimeProvider = nil
                return provider
            }
            return SharedProvider.instance
        }
        
        set {
            SharedProvider.instance = newValue
        }
    }
    // MARK: - Public

    func request(_ target: AppAPI) -> Promise<APIResponse> {
        let (promise, resolve, reject) = Promise<APIResponse>.pending()
        appRequest(target, success: { (jsonables) in
            resolve(jsonables)
        }, failure: {error, _ in
            reject(error)
        })
        return promise
    }
    
    // MARK: - Private
    private func appRequest(_ target: AppAPI, success: @escaping SuccessCompletion){
        appRequest((target: target, success: success, failure: {_,_ in}))
    }
    private func appRequest(_ target: AppAPI, success: @escaping SuccessCompletion, failure: @escaping FailureCompletion){
        appRequest((target: target, success: success, failure: failure))
    }
    private func appRequest(_ request: RequestClosure) {
        let target = request.target
        let success = request.success
        let failure = request.failure
        print("ZZZZ")
        
        AppProvider.sharedProvider.request(target) { (result) in
            print(result)
        }
    }
}
