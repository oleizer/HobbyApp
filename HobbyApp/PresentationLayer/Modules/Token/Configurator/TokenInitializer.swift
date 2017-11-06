//
//  TokenTokenInitializer.swift
//  HobbyApp
//
//  Created by Oleg Leizer on 06/11/2017.
//  Copyright © 2017 idev.kz. All rights reserved.
//

import UIKit

class TokenModuleInitializer: NSObject {

    //Connect with object on storyboard
    @IBOutlet weak var tokenViewController: TokenViewController!

    override func awakeFromNib() {

        let configurator = TokenModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: tokenViewController)
    }

}
