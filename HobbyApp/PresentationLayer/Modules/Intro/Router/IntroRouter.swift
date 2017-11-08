//
//  IntroIntroRouter.swift
//  HobbyApp
//
//  Created by Oleg Leizer on 07/11/2017.
//  Copyright © 2017 idev.kz. All rights reserved.
//

class IntroRouter: IntroRouterInput {
    var transitionHandler: ModuleTransitionSource!
    func showLogin() {
        transitionHandler.openModule(segueIdentifier: StoryboardSegue.Intro.toLogin.rawValue)
    }
}
