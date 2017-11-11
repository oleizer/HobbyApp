//
//  ActivityDetailActivityDetailConfigurator.swift
//  HobbyApp
//
//  Created by Oleg Leizer on 10/11/2017.
//  Copyright © 2017 idev.kz. All rights reserved.
//

import UIKit

class ActivityDetailModuleConfigurator {

    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {

        if let viewController = viewInput as? ActivityDetailViewController {
            configure(viewController: viewController)
        }
    }

    private func configure(viewController: ActivityDetailViewController) {

        let router = ActivityDetailRouter()
        router.transitionHandler = viewController
        let presenter = ActivityDetailPresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = ActivityDetailInteractor()
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter
        viewController.moduleInput = presenter
    }

}
