//
//  TokenTokenViewController.swift
//  HobbyApp
//
//  Created by Oleg Leizer on 06/11/2017.
//  Copyright © 2017 idev.kz. All rights reserved.
//

import UIKit

class TokenViewController: UIViewController, TokenViewInput, ModuleTransitionDestination {
    

    var output: TokenViewOutput!
    var moduleInput: ModuleInput!

    // MARK: IBOutlet
    @IBOutlet weak var tokenTextField: UITextField!
    @IBOutlet weak var saveButton: UIButton!
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }


    // MARK: TokenViewInput
    func setupInitialState() {
    }
    @IBAction func saveButtonTouched(_ sender: Any) {
        //output.login("oleizer@gmail.com")
        output.confirm("6e548e6831adebf50f9280d10b805347f34598805c3f75e388646bc53069be02")
    }
}
