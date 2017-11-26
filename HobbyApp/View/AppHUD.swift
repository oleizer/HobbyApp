//
//  AppHUD.swift
//  HobbyApp
//
//  Created by Олег Лейзер on 07.11.2017.
//  Copyright © 2017 Олег Лейзер. All rights reserved.
//

import MBProgressHUD

class AppHUD {
    @discardableResult
    class func showLoadingHudInView(_ view: UIView) -> MBProgressHUD? {
        var existingHub: MBProgressHUD?
        for subview in view.subviews {
            if let found = subview as? MBProgressHUD {
                existingHub = found
                break
            }
        }
        if let existingHub = existingHub {
            return existingHub
        }

        let hud = MBProgressHUD.showAdded(to: view, animated: true)
        return hud
    }

    class func hideLoadingHudInView(_ view: UIView) {
        MBProgressHUD.hide(for: view, animated: true)
    }

}
