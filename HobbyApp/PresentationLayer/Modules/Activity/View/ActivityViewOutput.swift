//
//  ActivityActivityViewOutput.swift
//  HobbyApp
//
//  Created by Oleg Leizer on 10/11/2017.
//  Copyright © 2017 idev.kz. All rights reserved.
//

protocol ActivityViewOutput {

    /**
        @author Oleg Leizer
        Notify presenter that view is ready
    */

    func viewIsReady()
    func object(atIndex index: Int) -> Activity
    func numberOfRows() -> Int
    func didSelectRow(atIndex index: Int)
}
