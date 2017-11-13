//
//  LoginLoginRouter.swift
//  HobbyApp
//
//  Created by Oleg Leizer on 06/11/2017.
//  Copyright © 2017 idev.kz. All rights reserved.
//

class LoginRouter: LoginRouterInput {
    var transitionHandler: ModuleTransitionSource!
    func showToken(withEmail email: String) {
        transitionHandler.openModule(segueIdentifier: StoryboardSegue.Login.toToken.rawValue, configurationBlock: { (moduleInput: TokenModuleInput) in
            moduleInput.setEmail(email)
        })
    }
}
