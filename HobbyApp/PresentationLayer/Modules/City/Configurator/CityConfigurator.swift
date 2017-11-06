//
//  CityCityConfigurator.swift
//  HobbyApp
//
//  Created by Oleg Leizer on 03/11/2017.
//  Copyright © 2017 idev.kz. All rights reserved.
//

import UIKit

class CityModuleConfigurator {

    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {

        if let viewController = viewInput as? CityViewController {
            configure(viewController: viewController)
        }
    }

    private func configure(viewController: CityViewController) {

        let router = CityRouter()
        router.transitionHandler = viewController
        
        let presenter = CityPresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = CityInteractor()
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter
    }

}
