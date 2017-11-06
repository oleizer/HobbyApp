//
//  AddCityAddCityViewController.swift
//  HobbyApp
//
//  Created by Oleg Leizer on 06/11/2017.
//  Copyright © 2017 idev.kz. All rights reserved.
//

import UIKit

class AddCityViewController: UIViewController, AddCityViewInput {

    var output: AddCityViewOutput!

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }


    // MARK: AddCityViewInput
    func setupInitialState() {
    }
}
