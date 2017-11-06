//
//  AddCityAddCityConfigurator.swift
//  HobbyApp
//
//  Created by Oleg Leizer on 06/11/2017.
//  Copyright © 2017 idev.kz. All rights reserved.
//

import UIKit

class AddCityModuleConfigurator {

    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {

        if let viewController = viewInput as? AddCityViewController {
            configure(viewController: viewController)
        }
    }

    private func configure(viewController: AddCityViewController) {

        let router = AddCityRouter()

        let presenter = AddCityPresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = AddCityInteractor()
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter
    }

}
