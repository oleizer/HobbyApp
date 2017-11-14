//
//  LoginLoginViewController.swift
//  HobbyApp
//
//  Created by Oleg Leizer on 06/11/2017.
//  Copyright © 2017 idev.kz. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, LoginViewInput, KeyboardHandler {

    var output: LoginViewOutput!
    // MARK: - IBOutlet
    @IBOutlet weak var emailTextField: EmailTextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
    // MARK: - Varibles
    
    private var email: String {
        get { return emailTextField.text?.trimmingCharacters(in: CharacterSet.whitespaces) ?? "" }
        set { emailTextField.text = newValue }
    }
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
        email = "oleizer@gmail.com"
        //setupKeyboardObservers()
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        stopObservingKeyboardChanges()
    }


    // MARK: LoginViewInput
    func showLoadingHUD() {
        AppHUD.showLoadingHudInView(view)
    }
    func hideLoadingHUD() {
        AppHUD.hideLoadingHudInView(view)
    }


    func setupInitialState() {
        startObservingKeyboardChanges()
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.backgroundColor = .clear
        navigationItem.title = L10n.Login.Navigation.title


        loginButton.backgroundColor = ColorName.orange.color
        loginButton.setTitle(L10n.Login.Nextbutton.title, for: .normal)
        
        //loginButton.layer.cornerRadius = loginButton.bounds.height / 2


        emailTextField.font = FontFamily.SFUIText.medium.font(size: 20)
        emailTextField.borderStyle = .none
        emailTextField.layer.masksToBounds = true
        emailTextField.layer.cornerRadius = 10
        emailTextField.backgroundColor = ColorName.lightGray.color
        emailTextField.tintColor = ColorName.dark.color
        emailTextField.textAlignment = .left
        emailTextField.contentVerticalAlignment = .center
        emailTextField.placeholder = L10n.Login.Emailtextfield.placeholder
        emailTextField.delegate = self
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func showMessage(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
    }

//    private func setupKeyboardObservers() {
//        NotificationCenter.default.addObserver(forName: NSNotification.Name.UIKeyboardWillShow, object: nil, queue: nil) { (notification) in
//            self.keyboardWillShow(notification)
//        }
//        NotificationCenter.default.addObserver(forName: NSNotification.Name.UIKeyboardWillHide, object: nil, queue: nil) { (notification) in
//            self.keyboardWillHide(notification)
//        }
//    }
//
//    private func teardownKeyboardObservers() {
//        NotificationCenter.default.removeObserver(self)
//    }

//    private func keyboardWillShow(_ notification: Notification) {
//        let verticalPadding: CGFloat = 0
//        guard let value = notification.userInfo?[UIKeyboardFrameEndUserInfoKey] as? NSValue else { return }
//        let keyboardHeight = value.cgRectValue.height
//        self.keyboardBottomConstraint.constant = keyboardHeight + verticalPadding
//        UIView.animate(withDuration: 0.1, animations: { () -> Void in
//            self.view.layoutIfNeeded()
//        })
//    }
//    private func keyboardWillHide(_ notification: Notification) {
//        self.keyboardBottomConstraint.constant = 0
//        UIView.animate(withDuration: 0.1, animations: { () -> Void in
//            self.view.layoutIfNeeded()
//        })
//    }
//    func keyboardWillChangeAnimated(_ keyboard: Keyboard) {
//        keyboardWillChange(keyboard, animated: true)
//    }
//
//    func keyboardWillChange(_ keyboard: Keyboard, animated: Bool) {
//        let bottomInset = keyboard.keyboardBottomInset(inView: self.view)
//
//        appAnimate(duration: keyboard.duration, options: keyboard.options, animated: animated) {
//            self.keyboardBottomConstraint.constant = -bottomInset
//            //self.keyboardIsAnimating(keyboard)
//            self.view.layoutIfNeeded()
//        }
//    }
    
    @IBAction func loginAction(_ sender: Any) {
        view.endEditing(true)
        output.login(email)
    }
}

extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == emailTextField {
            loginAction(self)
            return false
        }
        return true
    }
}
