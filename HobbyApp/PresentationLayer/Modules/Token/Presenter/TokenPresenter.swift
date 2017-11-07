//
//  TokenTokenPresenter.swift
//  HobbyApp
//
//  Created by Oleg Leizer on 06/11/2017.
//  Copyright © 2017 idev.kz. All rights reserved.
//

class TokenPresenter: TokenModuleInput, TokenViewOutput, TokenInteractorOutput {

    weak var view: TokenViewInput!
    var interactor: TokenInteractorInput!
    var router: TokenRouterInput!

    func viewIsReady() {

    }

    func loadUser(_ token: String) {
        interactor.loadUser(token)
    }

    func loadUserFailed(_ error: Error) {

    }

    func loadUserSuccessful() {
        let token = AuthToken.sharedKeychain
        print(token.authToken)
    }
}
