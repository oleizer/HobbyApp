//
//  InterestInterestViewOutput.swift
//  HobbyApp
//
//  Created by Oleg Leizer on 09/11/2017.
//  Copyright © 2017 idev.kz. All rights reserved.
//

protocol InterestViewOutput {

    /**
        @author Oleg Leizer
        Notify presenter that view is ready
    */

    func viewIsReady()
    func object(atIndex index: Int) -> Interest
    func numberOfRows() -> Int
}
