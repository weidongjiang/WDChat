//
//  WDChatMineModel.swift
//  WDChat
//
//  Created by 蒋伟东 on 2022/3/8.
//

import Foundation
enum WDChatMineItemid {
    case mine
    case serve///服务
    case collect///收藏
    case friendsList///朋友圈
    case video///视频号
    case cardPack///卡包
    case face///表情
    case set///设置
}

class WDChatMineModel:NSObject {
    
    var iconImageName:String!
    var title:String!
    var itemid:WDChatMineItemid!
    var isHiddenline:Bool!
    
    
}
