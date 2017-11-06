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
    func login(_ email: String, result: @escaping (UserSpecification.Error?) -> Void) {
        UserService().login(email: email).thenFinally { user in
            print("User: \(user.email)")
            result(nil)
            }.catch { error in
                print(error)
                result(error as? UserSpecification.Error)
        }
        
//        UserService().createUser(with: email, success: {
//            result(nil)
//        }, failure: { error in
//            result(error)
//        })
    }
}
