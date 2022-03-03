//
//  WDChatConstants.swift
//  WDChat
//
//  Created by 蒋伟东 on 2022/3/2.
//

import Foundation
import UIKit


var KWDISFullScreen : Bool {
    if #available(iOS 11, *) {
        guard let w = UIApplication.shared.delegate?.window, let unwrapedWindow = w else {
            return false
        }
        if unwrapedWindow.safeAreaInsets.left > 0 || unwrapedWindow.safeAreaInsets.bottom > 0 {
            return true
        }
    }
    return false
}

var KWDNavBarHeight : CGFloat {
    return KWDISFullScreen ? 88 : 64
}

var KWDTabBarHeight : CGFloat {
    return KWDISFullScreen ? 83 : 49
}
var KWDTabBarSafe : CGFloat {
    return KWDISFullScreen ? 29 : 0
}

let KWDChatScreenWidth = UIScreen.main.bounds.size.width
let KWDChatScreenHeight = UIScreen.main.bounds.size.height
let KWDChatStatusBarHeight = UIApplication.shared.delegate?.window??.windowScene?.statusBarManager?.statusBarFrame.size.height



class WDChatConstants: NSObject {
    
    

    
    
}


