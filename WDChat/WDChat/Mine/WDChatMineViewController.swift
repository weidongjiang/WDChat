//
//  WDChatMineViewController.swift
//  WDChat
//
//  Created by 蒋伟东 on 2022/3/2.
//

import Foundation
import UIKit

class WDChatMineViewController: WDBaseViewController {
    
    var mineView:WDChatMineView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.isHidden = true
        
        initChatMineVCUI()
    }
    
    
    func initChatMineVCUI() {
        
        let mineViewH = KWDChatScreenHeight - KWDTabBarHeight

        self.mineView = WDChatMineView.init(frame: CGRect.init(x: 0, y: 0, width: KWDChatScreenWidth, height: mineViewH))
        self.view.addSubview(self.mineView)
        
        
    }
    
    
    
    
}
