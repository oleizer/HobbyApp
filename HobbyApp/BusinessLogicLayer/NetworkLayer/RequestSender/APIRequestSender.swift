//
//  APIRequestSender.swift
//  HobbyApp
//
//  Created by Олег Лейзер on 03.11.2017.
//  Copyright © 2017 Олег Лейзер. All rights reserved.
//

import Foundation
import Moya
import Result
import PromiseKit
//typealias APIResponse = (Any)
class APIRequestSender {
    fileprivate let provider: MoyaProvider<MultiTarget>
    
    init() {
        let endpointClosure = { (target: MultiTarget) -> Endpoint<MultiTarget> in
            let defaultEndpoint = MoyaProvider.defaultEndpointMapping(for: target)
            
            switch target.target {
            case let target as TargetSpecification:
                return defaultEndpoint.adding(newHTTPHeaderFields: target.defaultHeaders)
            default:
                fatalError("Unexpected target type")
            }
        }
        //var plugins: [PluginType] = [ErrorsProcessorPlugin()]
//        #if DEBUG
//            plugins.append(
//                NetworkLoggerPlugin(verbose: true, cURL: true) { (data: Data) -> (Data) in
//                    do {
//                        let dataAsJSON = try JSONSerialization.jsonObject(with: data)
//                        let prettyData =  try JSONSerialization.data(withJSONObject: dataAsJSON, options: .prettyPrinted)
//                        return prettyData
//                    } catch {
//                        return data
//                    }
//                }
//            )
//        #endif
        provider = MoyaProvider<MultiTarget>(endpointClosure: endpointClosure)
    }

    func sendRequest<TargetSpecificationType: TargetSpecification & Fallible>(
        targetSpecification: TargetSpecificationType,
        success: @escaping (_ response: Response) -> Void,
        failure: @escaping (_ error: TargetSpecificationType.Error) -> Void) {
        provider.request(MultiTarget(targetSpecification)) { result in
            switch result {
            case let .success(response):
                success(response)
            case let .failure(error):
                failure(TargetSpecificationType.Error.error(from: error))
            }
        }
    }
}
