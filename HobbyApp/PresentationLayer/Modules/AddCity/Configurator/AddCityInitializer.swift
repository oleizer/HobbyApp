//
//  AddCityAddCityInitializer.swift
//  HobbyApp
//
//  Created by Oleg Leizer on 06/11/2017.
//  Copyright © 2017 idev.kz. All rights reserved.
//

import UIKit

class AddCityModuleInitializer: NSObject {

    //Connect with object on storyboard
    @IBOutlet weak var addcityViewController: AddCityViewController!

    override func awakeFromNib() {

        let configurator = AddCityModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: addcityViewController)
    }

}
