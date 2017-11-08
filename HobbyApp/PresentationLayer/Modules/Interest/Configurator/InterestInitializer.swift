//
//  InterestInterestInitializer.swift
//  HobbyApp
//
//  Created by Oleg Leizer on 09/11/2017.
//  Copyright © 2017 idev.kz. All rights reserved.
//

import UIKit

class InterestModuleInitializer: NSObject {

    //Connect with object on storyboard
    @IBOutlet weak var interestViewController: InterestViewController!

    override func awakeFromNib() {
        let configurator = InterestModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: interestViewController)
    }

}
