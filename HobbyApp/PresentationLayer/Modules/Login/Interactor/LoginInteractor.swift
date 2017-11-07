//
//  LoginLoginInteractor.swift
//  HobbyApp
//
//  Created by Oleg Leizer on 06/11/2017.
//  Copyright © 2017 idev.kz. All rights reserved.
//
import PromiseKit
class LoginInteractor: LoginInteractorInput {

    weak var output: LoginInteractorOutput!
    
    func login(_ email: String) {
        UserService().login(email: email).thenFinally { user in
            //print("User: \(user.email)")
            //result(nil)
            self.output.loginSuccessful()
            }.catch { error in
                print(error)
                //let errorTitle = error.appErrorMessage ?? L10n.Error.unknownError
                //result(error as? UserSpecification.Error)
                self.output.loginFailed(error)
        }
    }
}
