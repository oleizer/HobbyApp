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
    private var email: String!
    
    // MARK: - TokenViewOutput
    func viewIsReady() {
        view.setupInitialState()
    }

    func showSelectCity() {

    }

    
    func showEmail() -> String {
        return self.email
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
    
    // MARK: - TokenModuleInput
    func setEmail(_ email: String) {
        self.email = email
    }
}
