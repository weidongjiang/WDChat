//
//  WDMainViewController.swift
//  WDChat
//
//  Created by 蒋伟东 on 2022/3/2.
//

import Foundation
import UIKit

class WDMainViewController: UITabBarController, UITabBarControllerDelegate {
    
    var messageVC : WDChatMessageViewController!
    var relationVC: WDChatRelationViewController!
    var findVC : WDChatFindViewController!
    var mineVC : WDChatMineViewController!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        31 185 34
        self.tabBar.tintColor = UIColor(red: 31.0/255.0, green: 185.0/255.0, blue: 34.0/255.0, alpha: 1.0)
        self.tabBar.barTintColor = .white
        self.tabBar.shadowImage = UIImage()
        self.tabBar.backgroundColor = .white
        
        // 添加
        addChildVC()
        
        // 设置导航栏和tab
        
    }
    
    func addChildVC()  {
        
        var navController : UINavigationController!
        
        if messageVC == nil {
            messageVC = WDChatMessageViewController()
            messageVC.tabBarItem = UITabBarItem(title: "消息", image: UIImage.init(named: "tabbar_mainframe")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal), selectedImage: UIImage.init(named: "tabbar_mainframeHL")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal))
            messageVC.title = "消息"
            
            navController = UINavigationController(rootViewController: messageVC)
            self.addChild(navController)
            
        }
        
        if relationVC == nil {
            relationVC = WDChatRelationViewController()
            relationVC.tabBarItem = UITabBarItem(title: "联系人", image: UIImage.init(named: "tabbar_contacts")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal), selectedImage: UIImage.init(named: "tabbar_contactsHL")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal))
            relationVC.title = "联系人"
            navController = UINavigationController(rootViewController: relationVC)
            self.addChild(navController)
        }
        
        
        if findVC == nil {
            findVC = WDChatFindViewController()
            findVC.tabBarItem = UITabBarItem(title: "发现", image: UIImage.init(named: "tabbar_discover")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal), selectedImage: UIImage.init(named: "tabbar_discoverHL")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal))
            findVC.title = "发现"
            navController = UINavigationController(rootViewController: findVC)
            self.addChild(navController)
        }
        
        if mineVC == nil {
            mineVC = WDChatMineViewController()
            mineVC.tabBarItem = UITabBarItem(title: "我的", image: UIImage.init(named: "tabbar_me")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal), selectedImage: UIImage.init(named: "tabbar_meHL")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal))
            mineVC.title = "我的"
            
            navController = UINavigationController(rootViewController: mineVC)
            self.addChild(navController)
        }
        
        
    }
    
}
