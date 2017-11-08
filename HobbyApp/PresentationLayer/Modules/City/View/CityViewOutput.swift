//
//  CityCityViewOutput.swift
//  HobbyApp
//
//  Created by Oleg Leizer on 03/11/2017.
//  Copyright © 2017 idev.kz. All rights reserved.
//

protocol CityViewOutput {

    /**
        @author Oleg Leizer
        Notify presenter that view is ready
    */
    func city(atIndex index: Int) -> City
    func numberOfRows() -> Int
    func viewIsReady()
    func didSelectCity(_ city: City)
    func doneAction()
}
