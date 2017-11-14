//
//  IntroIntroViewController.swift
//  HobbyApp
//
//  Created by Oleg Leizer on 07/11/2017.
//  Copyright © 2017 idev.kz. All rights reserved.
//

import UIKit

class IntroViewController: UIViewController, IntroViewInput {

    var output: IntroViewOutput!

    // MARK: IBOutlet
    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet private weak var nextButton: UIButton!

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }

    // MARK: IntroViewInput
    func setupInitialState() {
        welcomeLabel.text = L10n.Intro.Welcome.text
        infoLabel.text = L10n.Intro.Message.text
        nextButton.setTitle(L10n.Intro.Next.title, for: .normal)

        nextButton.backgroundColor = ColorName.orange.color
        nextButton.layer.cornerRadius = nextButton.bounds.height / 2
    }

    @IBAction func nextButtonTouched(_ sender: Any) {
        output.continueAction()
    }
}
