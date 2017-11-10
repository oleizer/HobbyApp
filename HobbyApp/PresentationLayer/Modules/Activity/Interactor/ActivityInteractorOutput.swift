//
//  ActivityActivityInteractorOutput.swift
//  HobbyApp
//
//  Created by Oleg Leizer on 10/11/2017.
//  Copyright © 2017 idev.kz. All rights reserved.
//

import Foundation

protocol ActivityInteractorOutput: class {
    func loadActivitiesSuccessful(_ activities: [Activity])
    func loadActivitiesFailed(_ error: Error)
}
