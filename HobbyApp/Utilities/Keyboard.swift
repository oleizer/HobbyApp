//
//  Keyboard.swift
//  HobbyApp
//
//  Created by Олег Лейзер on 13.11.2017.
//  Copyright © 2017 Олег Лейзер. All rights reserved.
//

import Foundation
import UIKit

protocol KeyboardHandler: class {
    var bottomConstraint: NSLayoutConstraint! { get set }

    func keyboardWillShow(_ notification: Notification)
    func keyboardWillHide(_ notification: Notification)

    func startObservingKeyboardChanges()
    func stopObservingKeyboardChanges()
}

extension KeyboardHandler where Self: UIViewController {

    func startObservingKeyboardChanges() {
        NotificationCenter.default.addObserver(forName: NSNotification.Name.UIKeyboardWillShow, object: nil, queue: nil, using: { (notification) in
            self.keyboardWillShow(notification)
        })
        NotificationCenter.default.addObserver(forName: NSNotification.Name.UIKeyboardWillChangeFrame, object: nil, queue: nil, using: { (notification) in
            self.keyboardWillShow(notification)
        })
        NotificationCenter.default.addObserver(forName: NSNotification.Name.UITextInputCurrentInputModeDidChange, object: nil, queue: nil, using: { (notification) in
            self.keyboardWillShow(notification)
        })
        NotificationCenter.default.addObserver(forName: NSNotification.Name.UIKeyboardWillHide, object: nil, queue: nil, using: { (notification) in
            self.keyboardWillHide(notification)
        })
    }
    func stopObservingKeyboardChanges() {
        NotificationCenter.default.removeObserver(self)
    }
    func keyboardWillShow(_ notification: Notification) {
        let verticalPadding: CGFloat = 0
        guard let value = notification.userInfo?[UIKeyboardFrameEndUserInfoKey] as? NSValue else { return }
        let keyboardHeight = value.cgRectValue.height
        self.bottomConstraint.constant = keyboardHeight + verticalPadding
        appAnimate(duration: 0.0, delay: 0, options: UIViewAnimationOptions.curveLinear, animated: true, animations: {
            self.view.layoutIfNeeded()

        })
    }
    func keyboardWillHide(_ notification: Notification) {
        self.bottomConstraint.constant = 0
        appAnimate(duration: 0.0, delay: 0, options: UIViewAnimationOptions.curveLinear, animated: true, animations: {
            self.view.layoutIfNeeded()

        })
    }
}
