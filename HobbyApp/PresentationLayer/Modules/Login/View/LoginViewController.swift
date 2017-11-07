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
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }

    @IBAction func loginButtonTouched(_ sender: Any) {
        output.login("oleizer@gmail.com")
        //output.login("")

    }
    
    // MARK: LoginViewInput
    func showLoadingHUD() {
        AppHUD.showLoadingHudInView(view)
    }
    func hideLoadingHUD() {
        AppHUD.hideLoadingHudInView(view)

    }
    func setupInitialState() {
        loginButton.backgroundColor = ColorName.orange.color
        loginButton.layer.cornerRadius = loginButton.bounds.height / 2
    }
    func showMessage(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
    }
}
