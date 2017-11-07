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
        CityService().fetchAllCities().thenFinally{ cities in
            self.output.loadCitiesSuccessful()
            //guard let `self` = self else { return }
            //self.cities = cities
            //self.tableView.reloadData()
            }.catch { error in
                print(error)
                self.output.loadCitiesFailed(error)
                //let errorTitle = error.appErrorMessage ?? L10n.Error.unknownError
                //result(error as? UserSpecification.Error)
                //self.output.loginFailed(error)
        }
    }
}
