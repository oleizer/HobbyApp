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
        if interactor.checkIfLoggedIn() {
            checkUser()
        }else{
            router.showLogin()
        }
    }

    // MARK: - IntroInteractorOutput
    func loadUserSuccessful() {
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
}
