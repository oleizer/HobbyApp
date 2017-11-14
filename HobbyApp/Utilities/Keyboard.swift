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
        UIView.animate(withDuration: 0.1, animations: { () -> Void in
            self.view.layoutIfNeeded()
        })
    }
    func keyboardWillHide(_ notification: Notification) {
        self.bottomConstraint.constant = 0
        UIView.animate(withDuration: 0.1, animations: { () -> Void in
            self.view.layoutIfNeeded()
        })
    }
}

//
//class Keyboard {
//    struct Notifications {
//        static let KeyboardWillShow = TypedNotification<Keyboard>(name: "kz.idev.HobbyApp.Keyboard.KeyboardWillShow")
//        static let KeyboardDidShow = TypedNotification<Keyboard>(name: "kz.idev.HobbyApp.Keyboard.KeyboardDidShow")
//        static let KeyboardWillHide = TypedNotification<Keyboard>(name: "kz.idev.HobbyApp.Keyboard.KeyboardWillHide")
//        static let KeyboardDidHide = TypedNotification<Keyboard>(name: "kz.idev.HobbyApp.Keyboard.KeyboardDidHide")
//    }
//
//    static let shared = Keyboard()
//
//    class func setup() {
//        _ = shared
//    }
//
//    var active = false
//    var external = false
//    var bottomInset: CGFloat = 0.0
//    var endFrame: CGRect = .zero
//    var curve = UIViewAnimationCurve.linear
//    var options = UIViewAnimationOptions.curveLinear
//    var duration: Double = 0.0
//
//    init() {
//        let center: NotificationCenter = NotificationCenter.default
//        center.addObserver(self, selector: #selector(Keyboard.willShow(_:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
//        center.addObserver(self, selector: #selector(Keyboard.didShow(_:)), name: NSNotification.Name.UIKeyboardDidShow, object: nil)
//        center.addObserver(self, selector: #selector(Keyboard.willHide(_:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
//        center.addObserver(self, selector: #selector(Keyboard.didHide(_:)), name: NSNotification.Name.UIKeyboardDidHide, object: nil)
//    }
//
//    deinit {
//        let center: NotificationCenter = NotificationCenter.default
//        center.removeObserver(self)
//    }
//
//    func keyboardBottomInset(inView: UIView) -> CGFloat {
//        let window: UIView = inView.window ?? inView
//        let bottom = window.convert(CGPoint(x: 0, y: window.bounds.size.height - bottomInset), to: inView.superview).y
//        let inset = inView.frame.size.height - bottom
//        if inset < 0 {
//            return 0
//        }
//        else {
//            return inset
//        }
//    }
//
//    @objc
//    func didShow(_ notification: Foundation.Notification) {
//        postNotification(Notifications.KeyboardDidShow, value: self)
//    }
//
//    @objc
//    func didHide(_ notification: Foundation.Notification) {
//        postNotification(Notifications.KeyboardDidHide, value: self)
//    }
//
//    func setFromNotification(_ notification: Foundation.Notification) {
//        if let durationValue = notification.userInfo?[UIKeyboardAnimationDurationUserInfoKey] as? NSNumber {
//            duration = durationValue.doubleValue
//        }
//        else {
//            duration = 0
//        }
//        if let rawCurveValue = (notification.userInfo?[UIKeyboardAnimationCurveUserInfoKey] as? NSNumber) {
//            let rawCurve = rawCurveValue.intValue
//            curve = UIViewAnimationCurve(rawValue: rawCurve) ?? .easeOut
//            let curveInt = UInt(rawCurve << 16)
//            options = UIViewAnimationOptions(rawValue: curveInt)
//        }
//        else {
//            curve = .easeOut
//            options = .curveEaseOut
//        }
//    }
//}
//
//extension Keyboard {
//    @objc
//    func willShow(_ notification: Foundation.Notification) {
//        active = true
//        setFromNotification(notification)
//        endFrame = (notification.userInfo![UIKeyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
//        let window = UIWindow.mainWindow
//        bottomInset = window.frame.size.height - endFrame.origin.y
//        external = endFrame.size.height > bottomInset
//
//        postNotification(Notifications.KeyboardWillShow, value: self)
//    }
//
//    @objc
//    func willHide(_ notification: Foundation.Notification) {
//        setFromNotification(notification)
//        endFrame = (notification.userInfo![UIKeyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
//        bottomInset = 0
//
//        let windowBottom = UIWindow.mainWindow.frame.size.height
//        if endFrame.origin.y >= windowBottom {
//            active = false
//            external = false
//        }
//        else {
//            external = true
//        }
//
//        postNotification(Notifications.KeyboardWillHide, value: self)
//    }
//}
