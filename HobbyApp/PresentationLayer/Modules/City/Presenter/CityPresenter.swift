//
//  CityCityPresenter.swift
//  HobbyApp
//
//  Created by Oleg Leizer on 03/11/2017.
//  Copyright © 2017 idev.kz. All rights reserved.
//

class CityPresenter: CityModuleInput, CityViewOutput, CityInteractorOutput {

    weak var view: CityViewInput!
    var interactor: CityInteractorInput!
    var router: CityRouterInput!

    func viewIsReady() {
        view.setupInitialState()
    }

    func loadCities() {
        view.showProgress()
        interactor.loadCities()
    }
    func loadCitiesSuccessful(_ cities: [City]) {
        view.hideProgress()
        view.setCities(cities: cities)
    }
    func loadCitiesFailed(_ error: Error) {
        view.hideProgress()
    }

    func addCityAction() {
        router.showAddCity()
    }
}
