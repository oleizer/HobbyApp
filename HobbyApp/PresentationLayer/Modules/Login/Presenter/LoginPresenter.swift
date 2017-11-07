//
//  LoginLoginPresenter.swift
//  HobbyApp
//
//  Created by Oleg Leizer on 06/11/2017.
//  Copyright © 2017 idev.kz. All rights reserved.
//

class LoginPresenter: LoginModuleInput, LoginViewOutput, LoginInteractorOutput {

    weak var view: LoginViewInput!
    var interactor: LoginInteractorInput!
    var router: LoginRouterInput!

    func viewIsReady() {
        view.setupInitialState()
    }
    
    func login(_ email: String) {
        view.showLoadingHUD()
        self.interactor.login(email)
    }
    func loginSuccessful() {
        view.hideLoadingHUD()
        router.showToken()
    }
    
    func loginFailed(_ error: Error) {
        view.hideLoadingHUD()
        self.view.showMessage(title: "Error", message: error.appErrorMessage ?? L10n.Error.unknownError)
    }

}
