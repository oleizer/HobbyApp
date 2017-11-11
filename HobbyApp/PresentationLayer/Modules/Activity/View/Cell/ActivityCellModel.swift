//
//  ActivityCellModel.swift
//  HobbyApp
//
//  Created by Олег Лейзер on 10.11.2017.
//  Copyright © 2017 Олег Лейзер. All rights reserved.
//

import UIKit

struct ActivityCellModel {
    let model: Activity


    var name: String {
        return model.name
    }
    var organization: String {
        return model.organizer.name
    }
    var age: String {
        return "От \(model.ageFrom)" + " до \(model.ageTo) лет"
    }
    var url: String {
        return model.picture.url.replacingOccurrences(of: "\\", with: "")
    }
}

extension ActivityCellModel: CellViewModel {
    func setup(cell: ActivityTableViewCell) {
        cell.nameLabel?.text = name
        cell.organizationLabel.text = organization
        cell.ageLabel.text = age
        cell.url = URL(string: url)
    }
}
