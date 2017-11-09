//
//  InterestInterestConfigurator.swift
//  HobbyApp
//
//  Created by Oleg Leizer on 09/11/2017.
//  Copyright © 2017 idev.kz. All rights reserved.
//

import UIKit

class InterestModuleConfigurator {

    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {

        if let viewController = viewInput as? InterestViewController {
            configure(viewController: viewController)
        }
    }

    private func configure(viewController: InterestViewController) {

        let router = InterestRouter()

        let presenter = InterestPresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = InterestInteractor()
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter
    }

}
