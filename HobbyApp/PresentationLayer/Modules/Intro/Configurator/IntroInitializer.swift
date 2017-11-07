//
//  IntroIntroInitializer.swift
//  HobbyApp
//
//  Created by Oleg Leizer on 07/11/2017.
//  Copyright © 2017 idev.kz. All rights reserved.
//

import UIKit

class IntroModuleInitializer: NSObject {

    //Connect with object on storyboard
    @IBOutlet weak var introViewController: IntroViewController!

    override func awakeFromNib() {

        let configurator = IntroModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: introViewController)
    }

}
