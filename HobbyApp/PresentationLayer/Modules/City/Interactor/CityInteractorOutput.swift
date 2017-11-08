//
//  CityCityInteractorOutput.swift
//  HobbyApp
//
//  Created by Oleg Leizer on 03/11/2017.
//  Copyright © 2017 idev.kz. All rights reserved.
//

import Foundation

protocol CityInteractorOutput: class {
    func loadCitiesSuccessful(_ cities: [City])
    func loadCitiesFailed(_ error: Error)
    func changeUserSuccessful(_ user: User)
    func changeUserFailed(_ error: Error)
}
