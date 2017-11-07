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

    func showSelectCity() {

    }

    func confirm(_ token: String) {
        view.showProgress()
        interactor.confirm(token)
    }

    func confirmTokenFailed(_ error: Error) {
        view.hideProgress()

    }

    func confirmTokenSuccessful() {
        view.hideProgress()
        router.showSelectCity()
    }
}
