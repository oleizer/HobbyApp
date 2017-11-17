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
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var emailTextField: EmailTextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
    // MARK: - Varibles

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }
    override func viewWillDisappear(_ animated: Bool) {
        stopObservingKeyboardChanges()
        super.viewWillDisappear(animated)
    }

    // MARK: LoginViewInput

    func setupInitialState() {
        startObservingKeyboardChanges()
        output.setupValidation(forEmailInput: AnyValidatableControl(self.emailTextField))
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.backgroundColor = .clear
        navigationItem.title = L10n.Login.Navigation.title

        loginButton.backgroundColor = ColorName.orange.color
        loginButton.setTitle(L10n.Login.Nextbutton.title, for: .normal)
        
        infoLabel.text = L10n.Login.Infolabel.text


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
    func showMessage(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
    }

    func setEmail(email: String) {
        //self.email = email
        emailTextField.text = email
        emailTextField.displayValidationResult(result: .valid)
    }
    // MARK: - Actions
    @IBAction func loginAction(_ sender: Any) {
        view.endEditing(true)
        output.login(emailTextField.text!)
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
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
