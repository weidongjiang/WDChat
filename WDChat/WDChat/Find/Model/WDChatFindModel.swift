//
//  WDChatFindModel.swift
//  WDChat
//
//  Created by 蒋伟东 on 2022/3/7.
//

import Foundation

enum WDChatFindItemid {
    case friendsList/// 朋友圈
    case video/// 视频号
    case live/// 直播
    case sweep///扫一扫
    case shake///摇一摇
    case look///看一看
    case search///搜一搜
    case nearby///附近
    case shopping///购物
    case game///游戏
    case applet///小程序
}

class WDChatFindModel: NSObject {
    
    var iconImageName:String!
    var title:String!
    var itemid:WDChatFindItemid!
    var isHiddenline:Bool!
    
}
