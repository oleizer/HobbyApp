//
//  SnapKitExtensions.swift
//  HobbyApp
//
//  Created by Олег Лейзер on 15.11.2017.
//  Copyright © 2017 Олег Лейзер. All rights reserved.
//

import SnapKit


enum Priority: ConstraintPriorityTarget {
    case high
    case medium
    case low
    case required

    var value: Float { return constraintPriorityTargetValue }
    var constraintPriorityTargetValue: Float {
        switch self {
        case .high: return UILayoutPriority.defaultHigh.rawValue
        case .medium: return Float((Double(UILayoutPriority.defaultHigh.rawValue) + TimeInterval(UILayoutPriority.defaultLow.rawValue)) / 2)
        case .low: return UILayoutPriority.defaultLow.rawValue
        case .required: return UILayoutPriority.required.rawValue
        }
    }

}
