//
//  AddCityAddCityPresenter.swift
//  HobbyApp
//
//  Created by Oleg Leizer on 06/11/2017.
//  Copyright © 2017 idev.kz. All rights reserved.
//

class AddCityPresenter: AddCityModuleInput, AddCityViewOutput, AddCityInteractorOutput {

    weak var view: AddCityViewInput!
    var interactor: AddCityInteractorInput!
    var router: AddCityRouterInput!

    func viewIsReady() {

    }
}
