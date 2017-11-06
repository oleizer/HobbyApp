//
//  LoginLoginViewOutput.swift
//  HobbyApp
//
//  Created by Oleg Leizer on 06/11/2017.
//  Copyright © 2017 idev.kz. All rights reserved.
//

protocol LoginViewOutput {

    /**
        @author Oleg Leizer
        Notify presenter that view is ready
    */

    func viewIsReady()
    func login(_ email: String)
}
