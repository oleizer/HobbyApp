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
        print(email)
        self.interactor.login(email) { [unowned self] error in
            if let error = error {
                print(error)
            } else {
                print("Success")
                self.router.showToken()
            }
        }

    }

}
