//
//  TokenTokenConfigurator.swift
//  HobbyApp
//
//  Created by Oleg Leizer on 06/11/2017.
//  Copyright © 2017 idev.kz. All rights reserved.
//

import UIKit

class TokenModuleConfigurator {

    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {

        if let viewController = viewInput as? TokenViewController {
            configure(viewController: viewController)
        }
    }

    private func configure(viewController: TokenViewController) {

        let router = TokenRouter()
        router.transitionHandler = viewController

        let presenter = TokenPresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = TokenInteractor()
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter
    }

}
