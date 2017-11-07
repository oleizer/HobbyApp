//
//  ViewInput.swift
//  HobbyApp
//
//  Created by Олег Лейзер on 07.11.2017.
//  Copyright © 2017 Олег Лейзер. All rights reserved.
//

import Foundation
import MBProgressHUD
protocol ViewInput: class {
    func showProgress()
    func hideProgress()
}

extension ViewInput where Self: UIViewController {
    func showProgress() {
        print("Show progress")
        MBProgressHUD.showAdded(to: self.view, animated: true)
    }
    func hideProgress() {
        print("Hide progress")
        MBProgressHUD.hide(for: self.view, animated: true)
    }
}
