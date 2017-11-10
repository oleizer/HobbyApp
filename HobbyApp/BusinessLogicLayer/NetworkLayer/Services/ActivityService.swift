//
//  ActivityService.swift
//  HobbyApp
//
//  Created by Олег Лейзер on 10.11.2017.
//  Copyright © 2017 Олег Лейзер. All rights reserved.
//

import Foundation
import PromiseKit
class ActivityService {
    func searchActivity(params: [String: Any]) -> Promise<[Activity]> {
        return APIProvider.shared.request(ActivitySpecification.search(params: params)).then(execute: { data -> [Activity] in
            guard let result = data as? [Activity] else {
                throw NSError.uncastableJSONAble()
            }
            return result
        })
    }
}
