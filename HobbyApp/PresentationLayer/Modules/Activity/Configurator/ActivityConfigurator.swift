//
//  ActivityActivityConfigurator.swift
//  HobbyApp
//
//  Created by Oleg Leizer on 10/11/2017.
//  Copyright © 2017 idev.kz. All rights reserved.
//

import UIKit

class ActivityModuleConfigurator {

    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {

        if let viewController = viewInput as? ActivityViewController {
            configure(viewController: viewController)
        }
    }

    private func configure(viewController: ActivityViewController) {

        let router = ActivityRouter()
        router.transitionHandler = viewController

        let presenter = ActivityPresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = ActivityInteractor()
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter
    }

}
