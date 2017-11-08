//
//  ClosableRouter.swift
//

import Foundation

protocol ClosableRouter: Router {

    func close(animated: Bool)
}

extension ClosableRouter {

    func close(animated: Bool) {
        transitionHandler.closeCurrentModule(animated: animated)
    }
}
