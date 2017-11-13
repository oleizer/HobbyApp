//
//  TokenTokenViewOutput.swift
//  HobbyApp
//
//  Created by Oleg Leizer on 06/11/2017.
//  Copyright © 2017 idev.kz. All rights reserved.
//

protocol TokenViewOutput {

    /**
        @author Oleg Leizer
        Notify presenter that view is ready
    */

    func viewIsReady()
    func confirm(_ token: String)
    func showSelectCity()
    
    func showEmail() -> String
}
