//
//  WDChatMineViewController.swift
//  WDChat
//
//  Created by 蒋伟东 on 2022/3/2.
//

import Foundation
import UIKit

class WDChatMineViewController: WDMainBaseViewController {
    
    var mineView:WDChatMineView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initChatMineVCUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.tabBarController?.tabBar.isHidden = false
        self.view.backgroundColor = .white
        self.navigationController?.navigationBar.isHidden = true
        self.navigationController?.navigationBar.isTranslucent = true
        self.title = ""
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true

    }
    
    func initChatMineVCUI() {
        
        let mineViewH = KWDChatScreenHeight - KWDTabBarHeight

        self.mineView = WDChatMineView.init(frame: CGRect.init(x: 0, y: 0, width: KWDChatScreenWidth, height: mineViewH))
        self.view.addSubview(self.mineView)
        
        self.mineView.mineViewAvaterDidBlock = { [weak self] (mineModel,avaterImageView) -> Void in
            
            print(mineModel,avaterImageView)
            
            let vc = WDScanViewController()
            self?.navigationController?.pushViewController(vc, animated: true)
            self?.tabBarController?.tabBar.isHidden = true
            
        }
    }
    
    
    
    
}
