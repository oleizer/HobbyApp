//
//  IntroIntroInteractorOutput.swift
//  HobbyApp
//
//  Created by Oleg Leizer on 07/11/2017.
//  Copyright © 2017 idev.kz. All rights reserved.
//

import Foundation

protocol IntroInteractorOutput: class {
    func loadUserSuccessful(_ user: User)
    func loadUserFailure(_ error: Error)
}
