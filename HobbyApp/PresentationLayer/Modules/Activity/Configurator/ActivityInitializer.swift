//
//  ActivityActivityInitializer.swift
//  HobbyApp
//
//  Created by Oleg Leizer on 10/11/2017.
//  Copyright © 2017 idev.kz. All rights reserved.
//

import UIKit

class ActivityModuleInitializer: NSObject {

    //Connect with object on storyboard
    @IBOutlet weak var activityViewController: ActivityViewController!

    override func awakeFromNib() {

        let configurator = ActivityModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: activityViewController)
    }

}
