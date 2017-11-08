//
//  AuthToken.swift
//  HobbyApp
//
//  Created by Олег Лейзер on 06.11.2017.
//  Copyright © 2017 Олег Лейзер. All rights reserved.
//


import SwiftyJSON


struct AuthToken {
    static var sharedKeychain: KeychainType = AppKeychain()
    var keychain: KeychainType

    // MARK: - Initializers

    init() {
        keychain = AuthToken.sharedKeychain
    }

    // MARK: - Properties
    var token: String? {
        get { return keychain.authToken }
        set(newToken) { keychain.authToken = newToken }
    }

    var email: String? {
        get { return keychain.email }
        set { keychain.email = newValue }
    }


    static func storeToken(_ token: String, email: String? = nil) {
        var authToken = AuthToken()
        if let email = email {
            authToken.email = email
        }
        authToken.token = token
    }

    static func reset() {
        var keychain = sharedKeychain
        keychain.authToken = nil
        keychain.email = nil

    }
}
