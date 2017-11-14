//
//  ValidatableControl.swift
//  HobbyApp
//
//  Created by Олег Лейзер on 14.11.2017.
//  Copyright © 2017 Олег Лейзер. All rights reserved.
//

import Foundation
import UIKit
import Validator

class FormValidator {

    fileprivate var controlValidators = Set<AnyControlValidator>()

    func setRules<Control>(ruleSet: ValidationRuleSet<Control.ValidatingType>, forControl control: Control)
        where Control: ValidatableControl {
            let validator = ControlValidator(control: control, rules: ruleSet, validationTriggers: [.editingDidEndOnExit, .editingDidEnd])
            controlValidators.insert(AnyControlValidator(validator: validator))
    }

    func displayValidationStatus() {
        controlValidators.forEach { $0.displayValidationStatus() }
    }

    func validate() -> ValidationResult {
        let results = controlValidators.map {
            $0.validate()
        }
        return ValidationResult.merge(results: results)
    }
}


protocol AbstractControlValidator: Validator {
    var control: UIControl { get }

    func displayValidationStatus()
}

final class AnyControlValidator: AbstractControlValidator, Hashable {
    let validator: AbstractControlValidator

    init<C: AbstractControlValidator>(validator: C) {
        self.validator = validator
    }

    var control: UIControl {
        return validator.control
    }

    func validate() -> ValidationResult {
        return validator.validate()
    }

    func displayValidationStatus() {
        validator.displayValidationStatus()
    }

    var hashValue: Int {
        return control.hashValue
    }

    static func == (lhs: AnyControlValidator, rhs: AnyControlValidator) -> Bool {
        return lhs.control.isEqual(rhs.control)
    }
}

final class ControlValidator<Control: ValidatableControl>: AbstractControlValidator {
    typealias RuleSet = ValidationRuleSet<Control.ValidatingType>

    private let validatableControl: Control
    private let rules: RuleSet

    init(control: Control, rules: RuleSet, validationTriggers: [UIControlEvents]) {
        self.validatableControl = control
        self.rules = rules

        control.control.addTarget(self, action: #selector(onValueDidChange), for: .editingChanged)

        for event in validationTriggers {
            control.control.addTarget(self, action: #selector(displayValidationStatus), for: event)
        }
    }

    var control: UIControl {
        return validatableControl.control
    }

    func validate() -> ValidationResult {
        return validatableControl.validatingValue.validate(rules: rules)
    }

    @objc func displayValidationStatus() {
        validatableControl.displayValidationResult(result: validate())
    }

    @objc private func onValueDidChange() {
        validatableControl.validatableValueDidChange(value: validatableControl.validatingValue)
    }
}

protocol ValidatableControl {

    associatedtype ValidatingType: Validatable

    var control: UIControl { get }

    var validatingValue: ValidatingType { get }

    func displayValidationResult(result: ValidationResult)

    func validatableValueDidChange(value: ValidatingType)
}
private extension ValidatableControl {

    func getControl() -> UIControl {
        return control
    }

    func getValidatingValue() -> ValidatingType {
        return validatingValue
    }
}
class AnyValidatableControl<T>: ValidatableControl where T: Validatable {

    var control: UIControl {
        return _getControl()
    }

    var validatingValue: T {
        return _getValidatingValue()
    }

    private let _getControl: (() -> UIControl)

    private let _getValidatingValue: (() -> T)

    private let _displayValidationResult: ((ValidationResult) -> Void)

    private let _validatableValueDidChange: ((T) -> Void)

    required init<U: ValidatableControl>(_ validatableControl: U) where U.ValidatingType == T {
        _getControl = validatableControl.getControl
        _getValidatingValue = validatableControl.getValidatingValue
        _displayValidationResult = validatableControl.displayValidationResult(result:)
        _validatableValueDidChange = validatableControl.validatableValueDidChange(value:)
    }

    func displayValidationResult(result: ValidationResult) {
        _displayValidationResult(result)
    }

    func validatableValueDidChange(value: T) {
        _validatableValueDidChange(value)
    }
}
