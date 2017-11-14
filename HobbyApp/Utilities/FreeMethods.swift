//
//  FreeMethods.swift
//  HobbyApp
//
//  Created by Олег Лейзер on 07.11.2017.
//  Copyright © 2017 Олег Лейзер. All rights reserved.
//

import Foundation
import UIKit
//
//// MARK: Animations
//
//struct AnimationOptions {
//    let duration: TimeInterval
//    let delay: TimeInterval
//    let options: UIViewAnimationOptions
//}
//
//class AnimationPromise {
//    var completionBlock: ((Bool) -> Void)?
//    var alwaysBlock: (() -> Void)?
//    var resolved: Bool?
//
//    func completion(_ block: @escaping (Bool) -> Void) {
//        if let resolved = resolved {
//            block(resolved)
//            return
//        }
//        completionBlock = block
//    }
//
//    func always(_ block: @escaping Block) {
//        if resolved != nil {
//            block()
//            return
//        }
//        alwaysBlock = block
//    }
//
//    func resolve(completed: Bool) {
//        resolved = completed
//        completionBlock?(completed)
//        alwaysBlock?()
//    }
//}
//
//let DefaultAnimationDuration: TimeInterval = 0.2
//let DefaultAppleAnimationDuration: TimeInterval = 0.3
//
//@discardableResult
//func animateWithKeyboard(
//    animated: Bool? = nil,
//    animations: @escaping () -> Void
//    ) -> AnimationPromise{
//    return appAnimate(duration: Keyboard.shared.duration, options: Keyboard.shared.options, animated: animated, animations: animations)
//}
//
//@discardableResult
//func appAnimate(
//    duration: TimeInterval = DefaultAnimationDuration,
//    delay: TimeInterval = 0,
//    options: UIViewAnimationOptions = UIViewAnimationOptions(),
//    animated: Bool? = nil,
//    animations: @escaping () -> Void
//    ) -> AnimationPromise{
//    //let shouldAnimate: Bool = animated ?? !AppSetup.shared.isTesting
//    let options = AnimationOptions(duration: duration, delay: delay, options: options)
//    return performAnimation(options: options, animated: true, animations: animations)
//}
//
//
//@discardableResult
//private func performAnimation(
//    options: AnimationOptions,
//    animated: Bool = true,
//    animations: @escaping () -> Void
//    ) -> AnimationPromise
//{
//    let promise = AnimationPromise()
//    if animated {
//        UIView.animate(withDuration: options.duration, delay: options.delay, options: options.options, animations: animations, completion: promise.resolve)
//    }
//    else {
//        animations()
//        promise.resolve(completed: true)
//    }
//    return promise
//}

// MARK: Async, Timed, and Throttled closures
typealias Block = () -> Void

func delay(_ duration: TimeInterval, background: Bool = false, block: @escaping Block) {
    let killTimeOffset = Int64(CDouble(duration) * CDouble(NSEC_PER_SEC))
    let killTime = DispatchTime.now() + Double(killTimeOffset) / Double(NSEC_PER_SEC)
    let queue: DispatchQueue = background ? .global(qos: .background) : .main
    queue.asyncAfter(deadline: killTime, execute: block)
}
