//
//  FileManagerExtensions.swift
//  HobbyApp
//
//  Created by Олег Лейзер on 12.11.2017.
//  Copyright © 2017 Олег Лейзер. All rights reserved.
//

import Foundation
extension FileManager {
    class func AppDocumentsDir() -> String {
        return NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
    }
}
