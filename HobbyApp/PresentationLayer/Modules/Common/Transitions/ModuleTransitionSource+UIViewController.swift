//
//  ModuleTransitionHandler+UIViewController.swift
//

import UIKit

extension UIViewController {
    
    class func performSwizzling() {
        if self != UIViewController.self { return }

        let swizzlingClosure: () = {
            UIViewController().swizzlePrepareForSegue()
        }()

        swizzlingClosure
    }

    /// Swizzle prepare(for:sender:) with custom realisation.
    ///
    private func swizzlePrepareForSegue() {
        let originalSelector = #selector(UIViewController.prepare(for:sender:))
        let swizzledSelector = #selector(UIViewController.viper_prepare(for:sender:))
        let originalMethod = class_getInstanceMethod(UIViewController.self, originalSelector)
        let swizzledMethod = class_getInstanceMethod(UIViewController.self, swizzledSelector)

        let flag = class_addMethod(UIViewController.self,
                                   originalSelector,
                                   method_getImplementation(swizzledMethod!),
                                   method_getTypeEncoding(swizzledMethod!))

        if flag {
            class_replaceMethod(UIViewController.self,
                                swizzledSelector,
                                method_getImplementation(originalMethod!),
                                method_getTypeEncoding(originalMethod!))
        } else {
            method_exchangeImplementations(originalMethod!, swizzledMethod!)
        }
    }

    /// Try to configure destination view controller if segue initiated from ModuleTransitionHandler
    /// with properly configured ModuleTransition in sender.
    @objc private func viper_prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let transition = sender as? AnyModuleTransition {
            transition.configure(destination: segue.destination)
        }

        viper_prepare(for: segue, sender: sender)
    }
}

extension ModuleTransitionSource where Self: UIViewController {

    func openModule<DestinationModuleInput>(segueIdentifier: String, configurationBlock: @escaping ModuleConfigurationBlock<DestinationModuleInput>) {
        let transition = ModuleTransition(configurator: configurationBlock)
        self.performSegue(withIdentifier: segueIdentifier, sender: transition as AnyModuleTransition)
    }
}
