//
//  AuthToken.swift
//  HobbyApp
//
//  Created by Олег Лейзер on 06.11.2017.
//  Copyright © 2017 Олег Лейзер. All rights reserved.
//


import SwiftyJSON


struct AuthToken {
    static var sharedKeychain: KeychainType = ElloKeychain()
    var keychain: KeychainType
    
    // MARK: - Initializers
    
    init() {
        keychain = AuthToken.sharedKeychain
    }
    
    // MARK: - Properties
    
    var tokenWithBearer: String? {
        guard let key = keychain.authToken else { return nil }
        return "Bearer \(key)"
    }
    
    var token: String? {
        get { return keychain.authToken }
        set(newToken) { keychain.authToken = newToken }
    }
    
    var type: String? {
        get { return keychain.authTokenType }
        set(newType) { keychain.authTokenType = newType }
    }
    
    var refreshToken: String? {
        get { return keychain.refreshAuthToken }
        set(newRefreshToken) { keychain.refreshAuthToken = newRefreshToken }
    }
    
    var isPresent: Bool {
        return !(token ?? "").isEmpty
    }
    
    var isPasswordBased: Bool {
        get { return isPresent && keychain.isPasswordBased ?? false }
        set { keychain.isPasswordBased = newValue }
    }
    
    var isAnonymous: Bool {
        return isPresent && !isPasswordBased
    }
    
    var username: String? {
        get { return keychain.username }
        set { keychain.username = newValue }
    }
    
    var password: String? {
        get { return keychain.password }
        set { keychain.password = newValue }
    }
    
    var isStaff: Bool {
        get { return keychain.isStaff ?? false }
        set { keychain.isStaff = newValue }
    }
    
    var isNabaroo: Bool {
        get { return keychain.isNabaroo ?? false }
        set { keychain.isNabaroo = newValue }
    }
    
    static func storeToken(_ data: Data, isPasswordBased: Bool, email: String? = nil, password: String? = nil) {
        var authToken = AuthToken()
        authToken.isPasswordBased = isPasswordBased
        
        let json = JSON(data: data)
        if let email = email {
            authToken.username = email
        }
        if let password = password {
            authToken.password = password
        }
        authToken.token = json["access_token"].stringValue
        authToken.type = json["token_type"].stringValue
        authToken.refreshToken = json["refresh_token"].stringValue
        
        JWT.refresh()
    }
    
    static func reset() {
        var keychain = sharedKeychain
        keychain.authToken = nil
        keychain.refreshAuthToken = nil
        keychain.authTokenType = nil
        keychain.isPasswordBased = false
        keychain.username = nil
        keychain.password = nil
    }
}

