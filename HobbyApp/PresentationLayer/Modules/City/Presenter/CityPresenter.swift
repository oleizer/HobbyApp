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
    func addCityAction() {
        router.showAddCity()
    }
    func loadCities() {
        interactor.loadCities()
    }
    func loadCitiesSuccessful() {
        
    }
    func loadCitiesFailed(_ error: Error) {
        
    }
}
