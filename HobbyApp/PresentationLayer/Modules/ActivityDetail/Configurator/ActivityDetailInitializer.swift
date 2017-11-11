//
//  ActivityDetailActivityDetailInitializer.swift
//  HobbyApp
//
//  Created by Oleg Leizer on 10/11/2017.
//  Copyright © 2017 idev.kz. All rights reserved.
//

import UIKit

class ActivityDetailModuleInitializer: NSObject {

    //Connect with object on storyboard
    @IBOutlet weak var activitydetailViewController: ActivityDetailViewController!

    override func awakeFromNib() {

        let configurator = ActivityDetailModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: activitydetailViewController)
    }

}
