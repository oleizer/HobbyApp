//
//  ModuleTransitionHandler.swift
//

import UIKit

protocol ModuleTransitionDestination: class {
    var moduleInput: ModuleInput! { get }
}

/// A type that can open another module and properly configure it
protocol ModuleTransitionSource: class {

    /// Open module and configure is with block.
    /// DestinationModuleInput should be one of *ModuleInput protocols
    /// Make sure that segueIdentifier is lead to view controller that implement proper
    /// *ModuleInput protocol, otherwise configuration will fall with "ModuleTransition: Failed to configure"
    ///
    /// - Parameters:
    ///   - segueIdentifier: The identifier of segue which opens that module
    ///   - configurationBlock: The configuration closure to be executed before showing module view.
    func openModule<DestinationModuleInput>(segueIdentifier: String, configurationBlock: @escaping ModuleConfigurationBlock<DestinationModuleInput>)

    /// Open module
    ///
    /// - Parameter segueIdentifier: The identifier of segue which opens that module
    func openModule(segueIdentifier: String)

    /// Close module
    ///
    /// - Parameter animated: Uses in dismiss(animated:, completion:) and popViewController(animated:) methods
    func closeCurrentModule(animated: Bool)
}

extension ModuleTransitionSource {
    func openModule(segueIdentifier: String) {
        openModule(segueIdentifier: segueIdentifier) { (_: ModuleInput) in }
    }
}

extension UIViewController: ModuleTransitionSource {

    func closeCurrentModule(animated: Bool) {
        if let navigationController = parent as? UINavigationController, navigationController.childViewControllers.count > 1 {
            navigationController.popViewController(animated: animated)
        } else if presentingViewController != nil {
            dismiss(animated: animated, completion: nil)
        } else if view.superview != nil {
            removeFromParentViewController()
            view.removeFromSuperview()
        }
    }
}
