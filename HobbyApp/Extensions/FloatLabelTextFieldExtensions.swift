//
//  FloatLabelTextFieldExtensions.swift
//  HobbyApp
//
//  Created by Олег Лейзер on 17.11.2017.
//  Copyright © 2017 Олег Лейзер. All rights reserved.
//

import Foundation
import SkyFloatingLabelTextField

class FloatLabelTextField: SkyFloatingLabelTextField {
    
     @IBInspectable override var titleFont: UIFont {
        didSet {
            self.updateTitleFont()
        }
    }

    func updateTitleFont() {
        if let title = self.text,
            let font = self.titleFont ?? self.font {
            self.attributedText = NSAttributedString(string: title, attributes: [NSAttributedStringKey.foregroundColor: titleColor, NSAttributedStringKey.font: font])
        }
    }
    func updateSelectedTitle() {
        if self.hasErrorMessage {
            self.titleLabel.textColor = self.errorColor
        } else {
            if self.editingOrSelected || self.isHighlighted {
                self.titleLabel.textColor = self.selectedTitleColor
            } else {
                self.titleLabel.textColor = self.titleColor
            }
        }
        
        if let title = self.title,
            let font = self.titleFont ?? self.font {
            self.attributedPlaceholder = NSAttributedString(string: title, attributes: [NSAttributedStringKey.foregroundColor: titleColor, NSAttributedStringKey.font: font])
        }
    }
}
