//
//  TokenTokenInteractor.swift
//  HobbyApp
//
//  Created by Oleg Leizer on 06/11/2017.
//  Copyright © 2017 idev.kz. All rights reserved.
//
import PromiseKit

class TokenInteractor: TokenInteractorInput {

    weak var output: TokenInteractorOutput!

    func confirm(_ token: String) {
        AuthToken.storeToken(token, email: nil)

        UserService().loadUser(with: token).thenFinally(execute: { user in
            if let user = user as? User {
                AuthToken.storeToken(token, email: user.email)
                self.output.confirmTokenSuccessful()
            }else{
                AuthToken.reset()
                self.output.confirmTokenFailed(NSError.uncastableJSONAble())
            }

        }).catch { error in
            print(error)
            //let errorTitle = error.appErrorMessage ?? L10n.Error.unknownError
            //result(error as? UserSpecification.Error)
            self.output.confirmTokenFailed(NSError.uncastableJSONAble())
        }

    }
}
