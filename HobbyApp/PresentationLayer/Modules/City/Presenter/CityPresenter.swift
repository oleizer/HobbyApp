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
    private var cities: [City] = [City]() {
        didSet {
            if cities.count > 0 {
                view.showContent()
            }else{
                view.showNoContent()
            }
        }
    }
    var selectedCity: City?
//    var cities: [City] = [] {
//        didSet {
//            if cities.count > 0 {
//                view.showCityData(cities)
//            }else{
//                view.showNoContent()
//            }
//        }
//    }
    // MARK: - CityViewOutput
    func viewIsReady() {
        view.setupInitialState()
        view.changeDoneState(isEnabled: false)
        loadCities()
    }

    private func loadCities() {
        view.showProgress()
        interactor.loadCities()
    }
    func didSelectCity(_ city: City) {
        self.selectedCity = city
        view.changeDoneState(isEnabled: true)
    }
    func doneAction() {
        print("Done")
        guard let city = selectedCity else {
            return
        }
        interactor.setCity(city.id)
    }
    func city(atIndex index: Int) -> City {
        return cities[index]
    }
    func numberOfRows() -> Int {
        return cities.count
    }
    // MARK: - CityInteractorOutput
    func loadCitiesSuccessful(_ cities: [City]) {
        view.hideProgress()
        self.cities = cities
    }
    func loadCitiesFailed(_ error: Error) {
        view.hideProgress()
        view.showNoContent()
    }
    func changeUserSuccessful(_ user: User) {
        view.hideProgress()
        router.showInterest()
    }
    func changeUserFailed(_ error: Error) {
        view.hideProgress()
    }
}
