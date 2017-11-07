//
//  CityCityInteractorOutput.swift
//  HobbyApp
//
//  Created by Oleg Leizer on 03/11/2017.
//  Copyright © 2017 idev.kz. All rights reserved.
//

import Foundation

protocol CityInteractorOutput: class {
    func loadCitiesSuccessful()
    func loadCitiesFailed(_ error: Error)
}
