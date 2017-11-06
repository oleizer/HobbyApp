//
//  CityCityRouter.swift
//  HobbyApp
//
//  Created by Oleg Leizer on 03/11/2017.
//  Copyright © 2017 idev.kz. All rights reserved.
//

class CityRouter: CityRouterInput {
    var transitionHandler: ModuleTransitionSource!

    func showAddCity() {
        transitionHandler.openModule(segueIdentifier: StoryboardSegue.City.toAddCity.rawValue)
    }
}
