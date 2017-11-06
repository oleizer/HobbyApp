//
//  ModuleTransition.swift
//

import Foundation

/// Type-agnostic ModuleTransition
@objc protocol AnyModuleTransition: NSObjectProtocol {

    /// Configure `*ModuleInput`.
    /// Destination should the same `*ModuleInput` type that used in `openModule<DestinationModuleInput>(segueIdentifier:configurationBlock:))` call
    /// Otherwise this call will fall with "ModuleTransition: Destination moduleInput ... is not conform to required type ..." error.
    ///
    /// - Parameter destination: The *ModuleInput object.
    func configure(destination: Any)
}

/// Module configuration block
typealias ModuleConfigurationBlock<ModuleInputType> = (_ module: ModuleInputType) -> Void

/// The struct sending with segue that contains configuration block for module
class ModuleTransition<ModuleInputType>: NSObject, AnyModuleTransition {

    init(configurator: ModuleConfigurationBlock<ModuleInputType>?) {
        self.destinationConfigurator = configurator
    }

    let destinationConfigurator: ModuleConfigurationBlock<ModuleInputType>?

    func moduleInput(destinantion anyDestination: Any) -> ModuleInputType {
        guard let destination = anyDestination as? ModuleTransitionDestination else {
            fatalError("ModuleTransition: Destination \(anyDestination) is not ModuleTransitionDestination")
        }

        guard let moduleInput = destination.moduleInput as? ModuleInputType else {
            fatalError("ModuleTransition: Destination moduleInput \(destination.moduleInput) is not conform to required type \(ModuleInputType.self)")
        }

        return moduleInput
    }

    func configure(destination anyDestination: Any) {
        destinationConfigurator?(moduleInput(destinantion: anyDestination))
    }
}
