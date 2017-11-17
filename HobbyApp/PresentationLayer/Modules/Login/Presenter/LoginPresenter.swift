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

    private var validator = FormValidator()
//    private var email: String {
//        get { return self.email ?? "" }
//        set { view.setEmail(email: email) }
//    }
    // MARK: - LoginViewOutput

    func viewIsReady() {
        view.setEmail(email: "oleizer@gmail.com")
        view.setupInitialState()
    }
    func setupValidation(forEmailInput emailInput: AnyValidatableControl<String>) {
        validator.setRules(ruleSet: ValidationRules.email, forControl: emailInput)
    }
    
    func login(_ email: String) {
        switch validator.validate() {
        case .valid:
            view.showProgress()
            //self.email = email
            self.interactor.login(email)
        case .invalid:
            validator.displayValidationStatus()
        }
    }

    // MARK: - LoginInteractorOutput
    func loginSuccessful(_ email: String) {
        view.hideProgress()
        router.showToken(withEmail: email)
    }

    func loginFailed(_ error: Error) {
        view.hideProgress()
        self.view.showMessage(title: "Error", message: error.appErrorMessage ?? L10n.Error.unknownError)
    }

}
