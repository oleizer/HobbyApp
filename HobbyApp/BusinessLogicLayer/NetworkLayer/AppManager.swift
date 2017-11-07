//
//  AppManager.swift
//  HobbyApp
//
//  Created by Олег Лейзер on 05.11.2017.
//  Copyright © 2017 Олег Лейзер. All rights reserved.
//
import Alamofire

struct AppManager {
//    static var serverTrustPolicies: [String: ServerTrustPolicy] {
//        let policyDict: [String: ServerTrustPolicy]
//        if AppSetup.shared.isSimulator {
//            // make Charles plays nice in the sim by not setting a policy
//            policyDict = [:]
//        }
//        else {
//            policyDict = ElloCerts.policy
//        }
//        return policyDict
//    }

    static var manager: SessionManager {
        let config = URLSessionConfiguration.default
        config.sharedContainerIdentifier = "kz.idev.id"
        config.timeoutIntervalForRequest = 10
        config.timeoutIntervalForResource = 10
        return SessionManager(configuration: config)

//        return SessionManager(
//            configuration: config,
//            serverTrustPolicyManager: ServerTrustPolicyManager(policies: ElloManager.serverTrustPolicies)
//        )
    }
}
