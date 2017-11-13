//
//  IntroIntroPresenter.swift
//  HobbyApp
//
//  Created by Oleg Leizer on 07/11/2017.
//  Copyright © 2017 idev.kz. All rights reserved.
//

class IntroPresenter: IntroModuleInput, IntroViewOutput, IntroInteractorOutput {
    
    weak var view: IntroViewInput!
    var interactor: IntroInteractorInput!
    var router: IntroRouterInput!

    // MARK: - IntroViewOutput
    func viewIsReady() {
        view.setupInitialState()
    }
    //Открытие логина либо списка хобби в зависимости от результатов проверки на наличие токена
    func continueAction() {
        if checkIfLoggedIn() {
            checkUser()
            //router.showActivity()
        }else{
            router.showLogin()
        }
    }
    
    // MARK: - IntroInteractorOutput
    func loadUserSuccessful(_ user: User) {
        view.hideProgress()

        router.showActivity()
    }
    
    func loadUserFailure(_ error: Error) {
        view.hideProgress()
        AuthToken.reset()
        router.showLogin()
    }
    // MARK: - Private
    private func checkUser() {
        view.showProgress()
        interactor.loadUser()
    }
    //Проверка на наличие токена в keychain
    private func checkIfLoggedIn() -> Bool {
        let token = AuthToken()
        if token.token != nil {
            return true
        }else{
            return false
        }
    }
}
