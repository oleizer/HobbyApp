//
//  InterestService.swift
//  HobbyApp
//
//  Created by Олег Лейзер on 06.11.2017.
//  Copyright © 2017 Олег Лейзер. All rights reserved.
//

import Foundation
import PromiseKit
class InterestService {
    func getAllInterests() -> Promise<[Interest]> {
        return APIProvider.shared.request(InterestSpecification.interests).then(execute: { data -> [Interest] in
            guard let interests = data as? [Interest] else {
                throw NSError()
            }
            return interests
        })
    }
}
