//
//  Router.swift
//

import Foundation

protocol Router {
    weak var transitionHandler: ModuleTransitionSource! { get set }
}
