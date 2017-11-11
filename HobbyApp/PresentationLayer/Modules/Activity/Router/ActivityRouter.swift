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
//        transitionHandler.openModule(segueIdentifier: StoryboardSegue.Activity.toActivityDetail.rawValue) { (module: ActivityDetailModuleInput) in
//            module.setActivity(activity: activity)
//        }
//        let module = ActivityDetailModuleInitializer()
        transitionHandler.openModule(segueIdentifier: StoryboardSegue.Activity.toActivityDetail.rawValue, configurationBlock: { (moduleInput: ActivityDetailModuleInput) in
            print("ZZZZ")
            moduleInput.saveActivity(activity)
        })
        
//        transitionHandler.openModule(segueIdentifier: StoryboardSegue.Activity.toActivityDetail.rawValue, configurationBlock: { (module: ActivityDetailModuleInput) in
//            print("Test")
//            module.setActivity(activity: activity)
//            module.saveActivity(activity)
//        })
    }
}
