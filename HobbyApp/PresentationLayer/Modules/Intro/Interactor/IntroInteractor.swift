//
//  IntroIntroInteractor.swift
//  HobbyApp
//
//  Created by Oleg Leizer on 07/11/2017.
//  Copyright © 2017 idev.kz. All rights reserved.
//

class IntroInteractor: IntroInteractorInput {
    weak var output: IntroInteractorOutput!
    
    func loadUser() {
        UserService().loadUser(with: AuthToken().token!).thenFinally(execute: { user in
            self.output.loadUserSuccessful(user)
        }).catch(execute: { error in
            self.output.loadUserFailure(error)
        })

    }

}
