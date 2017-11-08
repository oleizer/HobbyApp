//
//  InterestCellModel.swift
//  HobbyApp
//
//  Created by Олег Лейзер on 09.11.2017.
//  Copyright © 2017 Олег Лейзер. All rights reserved.
//

import UIKit
struct InterestCellModel {
    let interest: Interest
    var name: String {
        return interest.name
    }
}

extension InterestCellModel: CellViewModel {
    func setup(cell: InterestTableViewCell) {
        cell.textLabel?.text = name
    }
}
