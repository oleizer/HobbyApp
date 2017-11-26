//
//  AppTextFieldStrategy.swift
//  HobbyApp
//
//  Created by Олег Лейзер on 17.11.2017.
//  Copyright © 2017 Олег Лейзер. All rights reserved.
//

import Foundation
import UIKit
protocol AppTextFieldStrategy {
    func styleTextField(textField: AppTextField)
}
final class AppTextFieldStyle {
    private let strategy: AppTextFieldStrategy
    init(_ strategy: AppTextFieldStrategy!) {
        self.strategy = strategy
    }
    func styleTextField(textField: AppTextField) {
        self.strategy.styleTextField(textField: textField)
    }
}

final class CommonAppTextField: AppTextFieldStrategy {
    func styleTextField(textField: AppTextField) {
        textField.tintColor = ColorName.dark.color
        textField.backgroundColor = .clear
        textField.autocapitalizationType = .none
        textField.autocorrectionType = .no
        textField.spellCheckingType = .no
        textField.enablesReturnKeyAutomatically = true
    }
}
final class EmailAppTextField: AppTextFieldStrategy {
    func styleTextField(textField: AppTextField) {
        CommonAppTextField().styleTextField(textField: textField)
        textField.title = L10n.Login.Emailtextfield.title
        textField.placeholder = L10n.Login.Emailtextfield.placeholder
        textField.clearButtonMode = .whileEditing
        textField.keyboardType = .emailAddress
        textField.returnKeyType = .next
        textField.isSecureTextEntry = false
        textField.clearsOnInsertion = false
        textField.placeholderFont = FontFamily.SFUIDisplay.light.font(size: 16)
        textField.placeholderColor = ColorName.grayCC.color
        textField.selectedTitleColor = ColorName.gray77.color
        textField.titleLabel.font = FontFamily.SFUIDisplay.regular.font(size: 12)
        textField.textColor = ColorName.dark.color
        textField.lineHeight = 1
        textField.lineColor = ColorName.grayCC.color
        textField.selectedLineColor = ColorName.gray77.color
        textField.selectedLineHeight = 1
    }
}

final class TokenAppTextField: AppTextFieldStrategy {
    func styleTextField(textField: AppTextField) {
        CommonAppTextField().styleTextField(textField: textField)
        textField.title = L10n.Token.Tokentextfield.title
        textField.placeholder = L10n.Token.Tokentextfield.placeholder
        textField.clearButtonMode = .whileEditing
        textField.keyboardType = .default
        textField.returnKeyType = .done
        textField.isSecureTextEntry = false
        textField.clearsOnInsertion = false
        textField.placeholderFont = FontFamily.SFUIDisplay.light.font(size: 16)
        textField.placeholderColor = ColorName.grayCC.color
        textField.selectedTitleColor = ColorName.gray77.color
        textField.titleLabel.font = FontFamily.SFUIDisplay.regular.font(size: 12)
        textField.textColor = ColorName.dark.color
        textField.lineHeight = 1
        textField.lineColor = ColorName.grayCC.color
        textField.selectedLineColor = ColorName.gray77.color
        textField.selectedLineHeight = 1
    }
}


