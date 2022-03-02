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
        
        setUpNavTabStyle()
        
        // 初始化window
        initWindow()
        
        
        return true
    }

    
    func initWindow () {
        
        window = UIWindow.init(frame: UIScreen.main.bounds)
        window?.rootViewController = WDMainViewController()
        window?.makeKeyAndVisible()
        
    }


    func setUpNavTabStyle() {
        
        let titleTextAttributes = [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 18.0),NSAttributedString.Key.foregroundColor : UIColor.black]
        UINavigationBar.appearance().titleTextAttributes = titleTextAttributes as [NSAttributedString.Key : Any]
        UINavigationBar.appearance().barTintColor = .black
    
        
    }
}

