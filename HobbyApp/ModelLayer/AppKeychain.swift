//
//  AppKeychain.swift
//  HobbyApp
//
//  Created by Олег Лейзер on 06.11.2017.
//  Copyright © 2017 Олег Лейзер. All rights reserved.
//

import KeychainAccess

protocol KeychainType {
    var authToken: String? { get set }
    var email: String? { get set }
}
