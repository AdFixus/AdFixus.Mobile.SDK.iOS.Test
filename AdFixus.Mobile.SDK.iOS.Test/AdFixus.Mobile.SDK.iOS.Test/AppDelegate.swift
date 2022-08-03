//
//  AppDelegate.swift
//  AdFixus.Mobile.SDK.iOS.Test
//
//  Created by ADFIXUS PTY LTD on 01/08/2022.
//  Copyright (c) ADFIXUS PTY LTD. All rights reserved.

import UIKit
import GoogleMobileAds
import AdFixusMobileAds

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        // Initialize Google Mobile Ads SDK
        let manager = ResponsiveAdManager()
        manager.initializeGADMobileAds(handler: nil)
        //GADMobileAds.sharedInstance().start(completionHandler: nil)

        //print("initializationStatus: \(String(describing: GADMobileAds.sharedInstance().initializationStatus)) \")")
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

