//
//  UIKitValidator.swift
//  HobbyApp
//
//  Created by Олег Лейзер on 14.11.2017.
//  Copyright © 2017 Олег Лейзер. All rights reserved.
//

import Foundation
import UIKit

extension ValidatableControl where Self: UIControl {
    var control: UIControl { return self }
}
