//
//  CityCityInitializer.swift
//  HobbyApp
//
//  Created by Oleg Leizer on 03/11/2017.
//  Copyright © 2017 idev.kz. All rights reserved.
//

import UIKit

class CityModuleInitializer: NSObject {

    //Connect with object on storyboard
    @IBOutlet weak var cityViewController: CityViewController!

    override func awakeFromNib() {

        let configurator = CityModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: cityViewController)
    }

}
