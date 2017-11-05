//
//  CityService.swift
//  HobbyApp
//
//  Created by Олег Лейзер on 03.11.2017.
//  Copyright © 2017 Олег Лейзер. All rights reserved.
//

import Foundation

struct CityService {
    
    func allCities() {
        
        AppProvider.shared.request(.cities).then { data -> [City] in
            guard let cities = data as? [City] else {
                throw NSError()
            }
            print(cities)
            return cities
        }
    }
}
