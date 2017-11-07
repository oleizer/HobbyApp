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

private let AuthEmail = "AppAuthEmail"
private let AuthTokenKey = "AppAuthToken"

struct AppKeychain: KeychainType {
    var keychain: Keychain
    
    init() {
        //let appIdentifierPrefix: String = ElloKeys().teamId()
        keychain = Keychain(service: "kz.idev.HobbyApp", accessGroup: "1.kz.idev.HobbyApp")
    }
    
    var authToken: String? {
        get { return keychain[AuthTokenKey] }
        set { keychain[AuthTokenKey] = newValue }
    }

    var email: String? {
        get { return keychain[AuthEmail] }
        set { keychain[AuthEmail] = newValue }
    }
}

