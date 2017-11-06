//
//  TokenTokenViewController.swift
//  HobbyApp
//
//  Created by Oleg Leizer on 06/11/2017.
//  Copyright © 2017 idev.kz. All rights reserved.
//

import UIKit

class TokenViewController: UIViewController, TokenViewInput {

    var output: TokenViewOutput!
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
        output.login("oleizer@gmail.com")
        
    }
}
