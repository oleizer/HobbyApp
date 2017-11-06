//
//  UserService.swift
//  HobbyApp
//
//  Created by Олег Лейзер on 06.11.2017.
//  Copyright © 2017 Олег Лейзер. All rights reserved.
//


import Foundation
import PromiseKit

class UserService {
    func login(email: String) -> Promise<User> {
        return APIProvider.shared.request(UserSpecification.createUser(email: email)).then(execute: { user -> User in
            guard let user = user as? User else {
                throw NSError()
            }
            return user
        })
    }
}
