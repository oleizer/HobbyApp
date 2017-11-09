//
//  InterestInterestInteractorOutput.swift
//  HobbyApp
//
//  Created by Oleg Leizer on 09/11/2017.
//  Copyright © 2017 idev.kz. All rights reserved.
//

import Foundation

protocol InterestInteractorOutput: class {
    func loadInterestsSuccessful(_ interests: [Interest])
    func loadInterestsFailed(_ error: Error)
}
