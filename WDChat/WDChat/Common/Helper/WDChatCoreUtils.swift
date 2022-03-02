//
//  WDChatCoreUtils.swift
//  WDChat
//
//  Created by 蒋伟东 on 2022/3/2.
//

import Foundation
import UIKit

class WDChatCoreUtils: NSObject {
    
    static func WDChatColorHexValue(_ hex:UInt ,alpha:CGFloat) -> UIColor {
        
        return UIColor(red: CGFloat((hex & 0xFF0000) >> 16) / 255.0, green: CGFloat((hex & 0x00FF00) >> 8) / 255.0, blue: CGFloat(hex & 0x0000FF) / 255.0, alpha:CGFloat(alpha))
    }
    
    
    
}
