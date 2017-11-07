//
//  TokenTokenInteractorOutput.swift
//  HobbyApp
//
//  Created by Oleg Leizer on 06/11/2017.
//  Copyright © 2017 idev.kz. All rights reserved.
//

import Foundation

protocol TokenInteractorOutput: class {
    func loadUserSuccessful()
    func loadUserFailed(_ error: Error)
}
