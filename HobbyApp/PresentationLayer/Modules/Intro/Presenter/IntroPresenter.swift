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

    func viewIsReady() {
        view.setupInitialState()
    }
    func showLogin() {
        router.showLogin()
    }
}
