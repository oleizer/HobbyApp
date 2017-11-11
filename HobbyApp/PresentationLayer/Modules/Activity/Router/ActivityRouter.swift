//
//  ActivityActivityRouter.swift
//  HobbyApp
//
//  Created by Oleg Leizer on 10/11/2017.
//  Copyright © 2017 idev.kz. All rights reserved.
//

class ActivityRouter: ActivityRouterInput {
    var transitionHandler: ModuleTransitionSource!
    func showActivityDetail(_ activity: Activity) {
        transitionHandler.openModule(segueIdentifier: StoryboardSegue.Activity.toActivityDetail.rawValue, configurationBlock: { (moduleInput: ActivityDetailModuleInput) in
            moduleInput.setActivity(activity: activity)
        })
    }
}
