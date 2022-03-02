//
//  AppDelegate.swift
//  WDChat
//
//  Created by 蒋伟东 on 2022/3/2.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        window = UIWindow.init(frame: UIScreen.main.bounds)
        window?.rootViewController = WDMainViewController()
        window?.makeKeyAndVisible()
        
        return true
    }

    


}

