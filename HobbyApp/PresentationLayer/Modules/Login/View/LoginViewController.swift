//
//  LoginLoginViewController.swift
//  HobbyApp
//
//  Created by Oleg Leizer on 06/11/2017.
//  Copyright © 2017 idev.kz. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, LoginViewInput {

    var output: LoginViewOutput!
    // MARK: - IBOutlet
    @IBOutlet weak var emailTextField: EmailTextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var keyboardBottomConstraint: NSLayoutConstraint!
    
    
    // MARK: - Varibles
    private var keyboardWillShowObserver: NotificationObserver?
    private var keyboardWillHideObserver: NotificationObserver?
    
    private var email: String {
        get { return emailTextField.text?.trimmingCharacters(in: CharacterSet.whitespaces) ?? "" }
        set { emailTextField.text = newValue }
    }
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
        email = "oleizer@gmail.com"
        setupKeyboardObservers()
    }
    deinit {
        teardownKeyboardObservers()
    }
    @IBAction func loginButtonTouched(_ sender: Any) {
        output.login(email)
    }

    // MARK: LoginViewInput
    func showLoadingHUD() {
        AppHUD.showLoadingHudInView(view)
    }
    func hideLoadingHUD() {
        AppHUD.hideLoadingHudInView(view)
    }


    func setupInitialState() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.backgroundColor = .clear
        navigationItem.title = L10n.Login.Navigation.title


        loginButton.backgroundColor = ColorName.orange.color
        loginButton.layer.cornerRadius = loginButton.bounds.height / 2


        emailTextField.font = FontFamily.SFUIText.medium.font(size: 20)
        emailTextField.borderStyle = .none
        emailTextField.layer.masksToBounds = true
        emailTextField.layer.cornerRadius = 10
        emailTextField.backgroundColor = ColorName.lightGray.color
        emailTextField.tintColor = ColorName.dark.color
        emailTextField.textAlignment = .left
        emailTextField.contentVerticalAlignment = .center

    }
    func showMessage(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
    }

    private func setupKeyboardObservers() {
        keyboardWillShowObserver = NotificationObserver(notification: Keyboard.Notifications.KeyboardWillShow, block: keyboardWillChangeAnimated)
        keyboardWillHideObserver = NotificationObserver(notification: Keyboard.Notifications.KeyboardWillHide, block: keyboardWillChangeAnimated)
    }

    private func teardownKeyboardObservers() {
        keyboardWillShowObserver?.removeObserver()
        keyboardWillHideObserver?.removeObserver()
        keyboardWillShowObserver = nil
        keyboardWillHideObserver = nil
    }

    func keyboardWillChangeAnimated(_ keyboard: Keyboard) {
        keyboardWillChange(keyboard, animated: true)
    }

    func keyboardWillChange(_ keyboard: Keyboard, animated: Bool) {
        let bottomInset = keyboard.keyboardBottomInset(inView: self.view)

        appAnimate(duration: keyboard.duration, options: keyboard.options, animated: animated) {
            self.keyboardBottomConstraint.constant = -bottomInset
            //self.keyboardIsAnimating(keyboard)
            self.view.layoutIfNeeded()
        }
    }
}
