//
//  APIProvider.swift
//  HobbyApp
//
//  Created by Олег Лейзер on 05.11.2017.
//  Copyright © 2017 Олег Лейзер. All rights reserved.
//

import Moya
import Result
import Alamofire
import PromiseKit

typealias APIResponse = (Any)

typealias APIRequestClosure = (target: TargetSpecification, success: APISuccessCompletion, failure: APIFailureCompletion)

typealias APISuccessCompletion = (Any) -> Void
typealias APIFailureCompletion = (NSError, Int?) -> Void

class APIProvider {
    static var shared: APIProvider = APIProvider()
//    static func endpointClosure(_ target: MultiTarget) -> Endpoint<MultiTarget> {
//        let endpoint = Endpoint(url: url(target), sampleResponseClosure: { return target.stubbedNetworkResponse }, method: target.method, task: target.task, httpHeaderFields: target.headers)
//        return endpoint
//    }
    static func DefaultProvider() -> MoyaProvider<MultiTarget> {
        let endpointClosure = { (target: MultiTarget) -> Endpoint<MultiTarget> in
            let defaultEndpoint = MoyaProvider.defaultEndpointMapping(for: target)

            switch target.target {
            case let target as TargetSpecification:
                return defaultEndpoint.adding(newHTTPHeaderFields: target.defaultHeaders)
            default:
                fatalError("Unexpected target type")
            }
        }
        var plugins: [PluginType] = []
        #if DEBUG
            plugins.append(
                NetworkLoggerPlugin(verbose: true, cURL: true) { (data: Data) -> (Data) in
                    do {
                        let dataAsJSON = try JSONSerialization.jsonObject(with: data)
                        let prettyData =  try JSONSerialization.data(withJSONObject: dataAsJSON, options: .prettyPrinted)
                        return prettyData
                    } catch {
                        return data
                    }
                }
            )
        #endif
        return MoyaProvider<MultiTarget>(endpointClosure: endpointClosure, manager: AppManager.manager, plugins: plugins)
        //return MoyaProvider<MultiTarget>(endpointClosure: APIProvider.endpointClosure, manager: ElloManager.manager)
    }
    private struct SharedProvider {
        static var instance = APIProvider.DefaultProvider()
    }
    static var oneTimeProvider: MoyaProvider<MultiTarget>?
    static var sharedProvider: MoyaProvider<MultiTarget> {
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
    
//    func sendRequest<TargetSpecificationType: TargetSpecification>(
//        targetSpecification: TargetSpecificationType ) -> Promise<APIResponse> {
//        let (promise, resolve, reject) = Promise<APIResponse>.pending()
//
//        appRequest(MultiTarget(targetSpecification) as! TargetSpecification, success: { (json) in
//            resolve(json)
//        }, failure: {error, _ in
//            reject(error)
//        })
//        return promise
//    }
    func request(_ target: TargetSpecification) -> Promise<APIResponse> {
        let (promise, resolve, reject) = Promise<APIResponse>.pending()
        appRequest(target, success: { (jsonables) in
            resolve(jsonables)
        }, failure: {error, _ in
            reject(error)
        })
        return promise
    }
    
    // MARK: - Private
    private func appRequest(_ target: TargetSpecification, success: @escaping APISuccessCompletion){
        appRequest((target: target, success: success, failure: {_,_ in}))
    }
    private func appRequest(_ target: TargetSpecification, success: @escaping APISuccessCompletion, failure: @escaping APIFailureCompletion){
        appRequest((target: target, success: success, failure: failure))
    }
    private func appRequest(_ request: APIRequestClosure) {
        let target = request.target
        let success = request.success
        let failure = request.failure
        print("ZZZZ")
        APIProvider.sharedProvider.request(MultiTarget(target)) { (result) in
            self.handleRequest(target: target, result: result, success: success, failure: failure)
        }
//        APIProvider.sharedProvider.request(target) { (result) in
//            print(result)
//            
//            //self.handleRequest(target: target, result: result, success: success, failure: failure)
//        }
    }
}

// MARK: appRequest implementation
extension APIProvider {
    private func handleRequest(target: TargetSpecification, result: MoyaResult, success: @escaping APISuccessCompletion, failure: @escaping APIFailureCompletion) {
        switch result {
        case let .success(moyaResponse):
            let response = moyaResponse.response as? HTTPURLResponse
            let data = moyaResponse.data
            let statusCode = moyaResponse.statusCode
            print(response)
            
            switch statusCode {
            case 200...299, 300...399:
                self.handleNetworkSuccess(data: data, target: target, statusCode: statusCode, response: response, success: success, failure: failure)
            default:
                print("de")
            }
            success(response)
        case let .failure(error):
            print(error)
        }
    }
    private func handleNetworkSuccess(data: Data, target: TargetSpecification, statusCode: Int?, response: HTTPURLResponse?, success: @escaping APISuccessCompletion, failure: @escaping APIFailureCompletion) {
        let (mappedJSON, error): (Any?, NSError?) = Mapper.mapJSON(data)
        //let responseConfig = parseResponse(response)
        if mappedJSON != nil && error == nil {
            if let dict = mappedJSON as? [String: Any] {
                parseDictionaryJSON(target, dict: dict, success: success, failure: failure)
            }else if let array = mappedJSON as? [[String: Any]] {
                parseArrayJSON(target, array: array, success: success, failure: failure)
            }
//            if let dict = mappedJSON as? [String: Any] {
//                parseLinked(elloAPI, dict: dict, responseConfig: responseConfig, success: success, failure: failure)
//            }
//            else {
//                ElloProvider.failedToMapObjects(failure)
//            }
        }
    }
    fileprivate func parseDictionaryJSON(_ target: TargetSpecification, dict: [String: Any], success: @escaping APISuccessCompletion, failure: @escaping APIFailureCompletion) {
        let completion: () -> Void = {
            var node: Any!
            node = dict[target.mappingType.rawValue]
            if node == nil {
                node = dict
            }
//            if target.mappingType == .noContentType {
//                node = dict
//            } else {
//                node = dict[target.mappingType.rawValue]
//            }
            //var newResponseConfig: ResponseConfig?
            //            if let pagingPath = appAPI.pagingPath,
            //                let links = (node as? [String: AnyObject])?["links"] as? [String: AnyObject],
            //                let pagingPathNode = links[pagingPath] as? [String:AnyObject],
            //                let pagination = pagingPathNode["pagination"] as? [String: String]
            //            {
            //                newResponseConfig = self.parsePagination(pagination)
            //            }
            
            guard target.mappingType != .noContentType else {
                success(UnknownJSONAble())
                return
            }
            
            let mappedObjects: AnyObject?
            if let node = node as? [[String: AnyObject]] {
                mappedObjects = Mapper.mapToObjectArray(node, type: target.mappingType) as AnyObject?
            } else if let node = node as? [String: AnyObject] {
                mappedObjects = Mapper.mapToObject(node as AnyObject?, type: target.mappingType)
            } else {
                mappedObjects = nil
            }
            
            if let mappedObjects = mappedObjects {
                success(mappedObjects)
            } else {
                APIProvider.failedToMapObjects(failure)
            }
        }
        completion()
//        if let linked = dict["linked"] as? [String: [[String: AnyObject]]] {
//            AppLinkedStore.sharedInstance.parseLinked(linked, completion: completion)
//        } else {
//            completion()
//        }
    }
    func parseArrayJSON(_ target: TargetSpecification, array: [[String: Any]], success: @escaping APISuccessCompletion, failure: @escaping APIFailureCompletion) {
        let completion: () -> Void = {
            //let node = array[appAPI.mappingType.rawValue]
            guard target.mappingType != .noContentType else {
                success(UnknownJSONAble())
                return
            }
            let mappedObjects: Any?
            //if array {
            mappedObjects = Mapper.mapToObjectArray(array, type: target.mappingType)
            //            }else{
            //                mappedObjects = nil
            //            }
            
            if let result = mappedObjects {
                success(result)
            } else {
                //APIProvider.failedToMapObjects(failure)
                APIProvider.failedToMapObjects(failure)
            }
        }
        completion()
    }


}
