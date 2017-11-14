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

    private var email: String?
    func viewIsReady() {
        view.setupInitialState()
    }

    func login(_ email: String) {
        //view.showLoadingHUD()
        self.email = email
        view.showProgress()
        self.interactor.login(email)
    }
    func loginSuccessful() {
        view.hideProgress()
        router.showToken(withEmail: email!)
    }

    func loginFailed(_ error: Error) {
        view.hideLoadingHUD()
        self.view.showMessage(title: "Error", message: error.appErrorMessage ?? L10n.Error.unknownError)
    }

}
