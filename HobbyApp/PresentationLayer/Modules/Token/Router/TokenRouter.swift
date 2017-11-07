//
//  TokenTokenRouter.swift
//  HobbyApp
//
//  Created by Oleg Leizer on 06/11/2017.
//  Copyright © 2017 idev.kz. All rights reserved.
//

class TokenRouter: TokenRouterInput {
    var transitionHandler: ModuleTransitionSource!

    func showSelectCity() {
        transitionHandler.openModule(segueIdentifier: StoryboardSegue.Token.toSelectCity.rawValue)
    }
}
