//
//  CityCityRouter.swift
//  HobbyApp
//
//  Created by Oleg Leizer on 03/11/2017.
//  Copyright © 2017 idev.kz. All rights reserved.
//
import UIKit
class CityRouter: CityRouterInput {
    var transitionHandler: ModuleTransitionSource!
    func showInterest() {
        if let window = UIApplication.shared.delegate?.window {
            let module = InterestModuleInitializer()
            let viewController = StoryboardScene.Interest.interestViewController.instantiate()
            module.interestViewController = viewController
            let navigationController = StoryboardScene.Interest.initialScene.instantiate()
            let nav = UINavigationController(rootViewController: module.interestViewController)
            window?.rootViewController = navigationController
        }
    }
}
