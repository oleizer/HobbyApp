//
//  LoginLoginViewController.swift
//  HobbyApp
//
//  Created by Oleg Leizer on 03/11/2017.
//  Copyright © 2017 idev.kz. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, LoginViewInput {

    var output: LoginViewOutput!

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }


    // MARK: LoginViewInput
    func setupInitialState() {
    }
}
