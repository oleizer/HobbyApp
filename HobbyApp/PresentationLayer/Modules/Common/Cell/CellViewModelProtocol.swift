//
//  CellViewModelProtocol.swift
//  HobbyApp
//
//  Created by Олег Лейзер on 09.11.2017.
//  Copyright © 2017 Олег Лейзер. All rights reserved.
//

import UIKit
protocol CellViewModel {
    associatedtype CellType: UIView
    func setup(cell: CellType)
}
