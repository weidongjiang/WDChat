//
//  WDColorExtension.swift
//  WDChat
//
//  Created by 蒋伟东 on 2022/3/7.
//

import Foundation
import UIKit

extension UIColor {
    
    class func wd_colorValue(red:CGFloat, green:CGFloat, blue:CGFloat, alpha:CGFloat) -> UIColor {
        return UIColor(red: red/255.0, green: green/255.0, blue: blue/255.0, alpha: alpha)
    }
    
    
    
    class func wd_colorWithHexString(hex:String,alpha:CGFloat)-> UIColor {
        var hexString = hex
        
        if (hexString.hasPrefix("#")) {
            hexString = (hexString as NSString).substring(from: 1)
        }
        
        let index = hexString.index(hexString.startIndex, offsetBy: 2)
        let index2 = hexString.index(hexString.startIndex, offsetBy: 4)
        
        let range = index ..< index2
        let s1:String = hexString.substring(to: index)
        let s2:String = hexString.substring(with: range)
        let s3 = hexString.substring(from: index2)
        
        return UIColor(red:CGFloat(hex2dec(num: s1))/255.0, green:CGFloat(hex2dec(num: s2)) / 255.0, blue:CGFloat(hex2dec(num: s3)) / 255.0, alpha:alpha)
    }
    
    class func hex2dec(num:String) -> Float {
        let str = num.uppercased()
        var sum:Float = 0
        for i in str.utf8 {
            sum = sum * 16 + Float(i) - 48 // 0-9 从48开始
            if i >= 65 {// A-Z 从65开始，但有初始值10，所以应该是减去55
                sum -= 7
            }
        }
        return sum
    }
    
}


//    class func wd_colorHexValue(_ hex:UInt ,alpha:CGFloat) -> UIColor {
//        return UIColor(red: CGFloat((hex & 0xFF0000) >> 16) / 255.0, green: CGFloat((hex & 0x00FF00) >> 8) / 255.0, blue: CGFloat(hex & 0x0000FF) / 255.0, alpha:CGFloat(alpha))
//    }
