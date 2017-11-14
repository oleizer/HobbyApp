//
//  ValidatorRules.swift
//  HobbyApp
//
//  Created by Олег Лейзер on 14.11.2017.
//  Copyright © 2017 Олег Лейзер. All rights reserved.
//

import Foundation
import Validator


protocol Validator {
    func validate() -> ValidationResult
}

// MARK: - Validation error

public enum ValidationError: Error {

    case wrongInput(description: String)
}

extension ValidationError: LocalizedError {

    public var errorDescription: String? {
        switch self {
        case .wrongInput(let description):
            return description
        }
    }
}


// MARK: - Rules

public enum ValidationRules {
    static let  email = ValidationRuleSet(rules: [ValidationRuleEmail()])
}

struct ValidationRuleEmail: ValidationRule {

    typealias InputType = String
    var error: Error {
        return ValidationError.wrongInput(description: "Email error")
    }
    func validate(input: String?) -> Bool {
        guard let input = input, !input.isEmpty else { return false }
        return NSPredicate(format: "SELF MATCHES %@", EmailValidationPattern.standard.pattern).evaluate(with: input)

    }
}
