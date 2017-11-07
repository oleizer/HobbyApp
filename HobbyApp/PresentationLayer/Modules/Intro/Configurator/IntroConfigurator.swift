//
//  IntroIntroConfigurator.swift
//  HobbyApp
//
//  Created by Oleg Leizer on 07/11/2017.
//  Copyright © 2017 idev.kz. All rights reserved.
//

import UIKit

class IntroModuleConfigurator {

    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {

        if let viewController = viewInput as? IntroViewController {
            configure(viewController: viewController)
        }
    }

    private func configure(viewController: IntroViewController) {

        let router = IntroRouter()
        router.transitionHandler = viewController

        let presenter = IntroPresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = IntroInteractor()
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter
    }

}
