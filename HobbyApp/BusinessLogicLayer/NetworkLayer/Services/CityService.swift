//
//  CityService.swift
//  HobbyApp
//
//  Created by Олег Лейзер on 03.11.2017.
//  Copyright © 2017 Олег Лейзер. All rights reserved.
//

import Foundation
import PromiseKit

class CityService {
    //private let requestSender = APIRequestSender()

    func addCity(_ name: String) {
        
    }
    func fetchAllCities() -> Promise<[City]> {
        return APIProvider.shared.request(CitySpecification.cities).then(execute: { data -> [City] in
            guard let cities = data as? [City] else {
                throw NSError()
            }
            return cities
        })
//        return APIProvider.shared.request(CitySpecification.cities)
//            .then { data -> [City] in
//            guard let cities = data as? [City] else {
//                throw NSError()
//            }
//            return cities
//        }
//        requestSender.sendRequest(targetSpecification: CitySpecification.cities, success: { (rescponse) in
//            print(rescponse)
//        }, failure: { error in
//            failure(error)
//        })

    }
    
    func fetchCity(by cityId: Int) {
        print("fetch city by cityId: \(cityId)")
        APIProvider.shared.request(CitySpecification.cityId(cityId: cityId))
//        requestSender.sendRequest(targetSpecification: CitySpecification.cityId(cityId: cityId)) { (response) in
//            print(response)
//        }
    }
    
}
