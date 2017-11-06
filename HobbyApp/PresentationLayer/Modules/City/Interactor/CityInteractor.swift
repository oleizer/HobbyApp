//
//  CityCityInteractor.swift
//  HobbyApp
//
//  Created by Oleg Leizer on 03/11/2017.
//  Copyright © 2017 idev.kz. All rights reserved.
//

class CityInteractor: CityInteractorInput {

    weak var output: CityInteractorOutput!
    func loadCities() {
        CityService().fetchAllCities().thenFinally{ [weak self] cities in
            //guard let `self` = self else { return }
            //self.cities = cities
            //self.tableView.reloadData()
            }.ignoreErrors()
    }
}
