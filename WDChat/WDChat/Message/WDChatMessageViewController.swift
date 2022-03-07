//
//  WDChatMessageViewController.swift
//  WDChat
//
//  Created by 蒋伟东 on 2022/3/2.
//

import Foundation
import UIKit

class WDChatMessageViewController :WDBaseViewController {
    
    var messageView : WDChatMessageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let messageViewH = KWDChatScreenHeight - KWDNavBarHeight - KWDTabBarHeight
        messageView = WDChatMessageView(frame: CGRect.init(x: 0, y: KWDNavBarHeight, width: KWDChatScreenWidth, height: messageViewH))
        self.view.addSubview(messageView)
        
        
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.messageView.updateChatMessageData()
        
    }
    
}
