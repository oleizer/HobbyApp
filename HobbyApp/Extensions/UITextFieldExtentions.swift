//
//  UITextFieldExtentions.swift
//  HobbyApp
//
//  Created by Олег Лейзер on 14.11.2017.
//  Copyright © 2017 Олег Лейзер. All rights reserved.
//

import Foundation
import UIKit
import Validator

extension UITextField {
    func isEmpty() -> Bool {
        return text == nil || text?.isEmpty == true
    }
}

extension UITextField: ValidatableControl {
    public var validatingValue: String {
        return text ?? ""
    }

    public func displayValidationResult(result: ValidationResult) {
        switch result {
        case .valid:
            print("normal")
            //displayNormalState()
        case .invalid(let errors):
            print("error")

            //displayInvalidState(error: errors.first)
        }
    }

    public func validatableValueDidChange(value: String) {
        //displayNormalState()
    }

//    private func displayNormalState() {
//        background = R.image.textFieldBackground()
//    }
//
//    private func displayInvalidState(error: Error?) {
//        background = R.image.textFieldErrorBackground()
//        shake()
//    }
}
