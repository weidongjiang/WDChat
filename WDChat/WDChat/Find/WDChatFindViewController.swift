//
//  WDChatFindViewController.swift
//  WDChat
//
//  Created by 蒋伟东 on 2022/3/2.
//

import Foundation
import UIKit

class WDChatFindViewController :WDBaseViewController {
    
    var chatFindView : WDChatFindView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let chatFindViewH = KWDChatScreenHeight - KWDNavBarHeight - KWDTabBarHeight

        chatFindView = WDChatFindView.init(frame: CGRect.init(x: 0, y: KWDNavBarHeight, width: KWDChatScreenWidth, height: chatFindViewH))
        self.view.addSubview(chatFindView)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.chatFindView.getChatFindViewData()
    }
    
}
