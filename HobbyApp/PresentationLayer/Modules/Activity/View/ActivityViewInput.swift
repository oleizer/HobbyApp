//
//  ActivityActivityViewInput.swift
//  HobbyApp
//
//  Created by Oleg Leizer on 10/11/2017.
//  Copyright © 2017 idev.kz. All rights reserved.
//

protocol ActivityViewInput: class, ViewInput {

    /**
        @author Oleg Leizer
        Setup initial state of the view
    */

    func setupInitialState()
    func showContent()
    func showNoContent()
}
