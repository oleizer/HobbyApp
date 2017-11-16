//
//  LoginLoginViewInput.swift
//  HobbyApp
//
//  Created by Oleg Leizer on 06/11/2017.
//  Copyright © 2017 idev.kz. All rights reserved.
//

protocol LoginViewInput: class, ViewInput {

    /**
        @author Oleg Leizer
        Setup initial state of the view
    */

    func setupInitialState()
    func showMessage(title: String, message: String)
    func setEmail(email: String)
}
