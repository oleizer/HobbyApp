//
//  IntroIntroRouter.swift
//  HobbyApp
//
//  Created by Oleg Leizer on 07/11/2017.
//  Copyright © 2017 idev.kz. All rights reserved.
//
import UIKit
class IntroRouter: IntroRouterInput {
    var transitionHandler: ModuleTransitionSource!
    func showLogin() {
        if let window = UIApplication.shared.delegate?.window {
            let module = LoginModuleInitializer()
            let viewController = StoryboardScene.Login.loginViewController.instantiate()
            module.loginViewController = viewController
            let nav = UINavigationController(rootViewController: module.loginViewController)
            window?.rootViewController = nav
        }
    }
    func showActivity() {
        if let window = UIApplication.shared.delegate?.window {
            let module = ActivityModuleInitializer()
            let viewController = StoryboardScene.Activity.activityViewController.instantiate()
            module.activityViewController = viewController
            let nav = UINavigationController(rootViewController: module.activityViewController)
            window?.rootViewController = nav
        }
    }
}
