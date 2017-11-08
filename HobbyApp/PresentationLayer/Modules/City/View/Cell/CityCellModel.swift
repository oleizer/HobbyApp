//
//  CityCellModel.swift
//  HobbyApp
//
//  Created by Олег Лейзер on 09.11.2017.
//  Copyright © 2017 Олег Лейзер. All rights reserved.
//

import UIKit
struct CityCellModel {
    let city: City
    var name: String {
        return city.name
    }
}

extension CityCellModel: CellViewModel {
    func setup(cell: CityTableViewCell) {
        cell.textLabel?.text = name
    }
}
