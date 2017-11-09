//
//  CityCityInteractor.swift
//  HobbyApp
//
//  Created by Oleg Leizer on 03/11/2017.
//  Copyright © 2017 idev.kz. All rights reserved.
//

class CityInteractor: CityInteractorInput {

    weak var output: CityInteractorOutput!
    func setCity(_ cityId: Int) {
        UserService().fetchUser().thenFinally(execute: { user in
            user.cityId = cityId
            UserService().changeUser(user).thenFinally(execute: { newUser in
                self.output.changeUserSuccessful(newUser)
            }).catch(execute: { error in
                self.output.changeUserFailed(error)
            })
        }).catch(execute: { error in
            self.output.changeUserFailed(error)
        })
    }

    func loadCities() {
        CityService().fetchAllCities().thenFinally{ cities in
            self.output.loadCitiesSuccessful(cities)
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
