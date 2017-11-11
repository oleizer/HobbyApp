//
//  ActivityDetailActivityDetailViewController.swift
//  HobbyApp
//
//  Created by Oleg Leizer on 10/11/2017.
//  Copyright © 2017 idev.kz. All rights reserved.
//

import UIKit

class ActivityDetailViewController: UIViewController, ActivityDetailViewInput, ModuleTransitionDestination {

    var output: ActivityDetailViewOutput!
    var moduleInput: ModuleInput!

    // MARK: IBOutlet

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }


    // MARK: ActivityDetailViewInput
    func setupInitialState() {
    }
}
