//
//  LoginLoginInteractorInput.swift
//  HobbyApp
//
//  Created by Oleg Leizer on 06/11/2017.
//  Copyright © 2017 idev.kz. All rights reserved.
//

import Foundation

protocol LoginInteractorInput {
    func login(_ email: String, result: @escaping (UserSpecification.Error?) -> Void)
    func login(_ email: String)

}
