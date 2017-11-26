//
//  AppTextField.swift
//  HobbyApp
//
//  Created by Олег Лейзер on 17.11.2017.
//  Copyright © 2017 Олег Лейзер. All rights reserved.
//

import Foundation
import UIKit
import InputMask

final class AppTextField: FloatLabelTextField {
    var firstResponderDidChange: ((Bool) -> Void)?

    required override init(frame: CGRect) {
        super.init(frame: frame)
        sharedSetup()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        sharedSetup()
    }
    func sharedSetup() {
        self.backgroundColor = .white
        self.setNeedsDisplay()
    }
    override var intrinsicContentSize: CGSize {
        return CGSize(width: UIViewNoIntrinsicMetric, height: 55)
    }
    override func titleLabelRectForBounds(_ bounds: CGRect, editing: Bool) -> CGRect {
        let rect = bounds.shrink(left: 15).inset(top: -25, sides: 15, bottom: 0)
        return rect
    }
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        var rect = bounds.shrink(left: 15).inset(top: 15, sides: 15, bottom: 0)
        if let leftView = leftView {
            rect = rect.shrink(right: leftView.frame.size.width + 6)
        }
        return rect
    }
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        var rect = bounds.shrink(left: 15).inset(top: 15, left: 15, bottom: 0, right: 10)
        if let leftView = leftView {
            rect = rect.shrink(right: leftView.frame.size.width + 6)
        }
        return rect
    }
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        var rect = bounds.shrink(left: 15).inset(top: 15, left: 15, bottom: -10, right: 10).offsetBy(dx: -30, dy: 0)
        if let leftView = leftView {
            rect = rect.shrink(right: leftView.frame.size.width + 6)
        }
        return rect
    }
    override func clearButtonRect(forBounds bounds: CGRect) -> CGRect {
        var rect = super.clearButtonRect(forBounds: bounds)
        rect.origin.x -= 10

        return rect
    }
    override func rightViewRect(forBounds bounds: CGRect) -> CGRect {
        var rect = super.rightViewRect(forBounds: bounds)
        rect.origin.x -= 10
        return rect
    }
    override func becomeFirstResponder() -> Bool {
        let value = super.becomeFirstResponder()
        firstResponderDidChange?(true)
        return value
    }
    override func resignFirstResponder() -> Bool {
        let value = super.resignFirstResponder()
        firstResponderDidChange?(false)
        return value
    }

    // MARK: - Private
    fileprivate func rectForBounds(_ bounds: CGRect) -> CGRect {
        let rect = bounds.shrink(left: 15).inset(topBottom: 10, sides: 15)
        return rect
    }
}

extension AppTextField {
}
