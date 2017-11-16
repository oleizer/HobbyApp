//
//  AppDelegate.swift
//  HobbyApp
//
//  Created by Олег Лейзер on 03.11.2017.
//  Copyright © 2017 Олег Лейзер. All rights reserved.
//

import UIKit
import PINRemoteImage

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, willFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey : Any]? = nil) -> Bool {
        printDebug(launchOptions)
        return true
    }

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {


        UIViewController.performSwizzling()

        if AppSetup.shared.isTesting {
            if UIScreen.main.scale > 2 {
                fatalError("Tests should be run in a @2x retina device (for snapshot specs to work)")
            }

//            if Bundle.main.bundleIdentifier != "kz.idev.HobbyAppDev" {
//                fatalError("Tests should be run with a bundle id of kz.idev.HobbyAppDev")
//            }
        }
        setupGlobalStyles()
        setupCaches()

        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    // MARK: - Private
    private func setupCaches() {
        let manager = PINRemoteImageManager.shared()
        let diskAgeLimit: TimeInterval = 1_209_600
        let diskByteLimit: UInt = 250_000_000
        let memoryByteLimit: UInt = 10_000_000
        manager.pinCache?.diskCache.ageLimit = diskAgeLimit
        manager.pinCache?.diskCache.byteLimit = diskByteLimit
        manager.pinCache?.memoryCache.costLimit = memoryByteLimit
    }
    private func setupGlobalStyles() {
        //Navigation bar
        UINavigationBar.appearance().largeTitleTextAttributes = [
            NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 22)
        ]
    }
    //  MARK: Debug

    func printDebug(_ launchOptions: [UIApplicationLaunchOptionsKey: Any]?) {
        let device = UIDevice.current
        let languages = UserDefaults.standard.object(forKey: "AppleLanguages") as! NSArray
        let currentLanguage = languages.firstObject

        print("Device model: \(UIDevice.current)")
        print("OS: \(device.systemName) \(device.systemVersion)")
        print("Language: \(String(describing: currentLanguage))")

    }
}
