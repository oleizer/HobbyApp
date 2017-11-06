//
//  LoginLoginConfigurator.swift
//  HobbyApp
//
//  Created by Oleg Leizer on 06/11/2017.
//  Copyright © 2017 idev.kz. All rights reserved.
//

import UIKit

class LoginModuleConfigurator {

    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {

        if let viewController = viewInput as? LoginViewController {
            configure(viewController: viewController)
        }
    }

    private func configure(viewController: LoginViewController) {

        let router = LoginRouter()
        router.transitionHandler = viewController
        let presenter = LoginPresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = LoginInteractor()
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter
    }

}
