//
//  WDChatMineViewModel.swift
//  WDChat
//
//  Created by 蒋伟东 on 2022/3/8.
//

import Foundation


class WDChatMineViewModel:NSObject {
    
    
    func getChatMineViewData() -> NSArray {
        
        let temps = NSMutableArray()
        
        let time_1 = NSMutableArray()
        let mineModel = WDChatMineModel()
        mineModel.iconImageName = "ppt"
        mineModel.title = "mine"
        mineModel.itemid = .mine
        mineModel.isHiddenline = true
        mineModel.iconAvaterUrlString = "http://medocdn.huoying666.com/images/20210918/4c259bcc1621c2afb78ee24777232fd9/4c259bcc16.jpg"
        mineModel.chatName = "每天都是新的一天"
        mineModel.chatid = "999999999999999999999999"
        
        time_1.add(mineModel)
        
        let time_2 = NSMutableArray()
        let serveModel = WDChatMineModel()
        serveModel.iconImageName = "ppt"
        serveModel.title = "服务"
        serveModel.itemid = .serve
        serveModel.isHiddenline = true
        
        time_2.add(serveModel)
        
        let time_3 = NSMutableArray()
        let collectModel = WDChatMineModel()
        collectModel.iconImageName = "ppt"
        collectModel.title = "收藏"
        collectModel.itemid = .collect
        collectModel.isHiddenline = false
        
        let friendsListModel = WDChatMineModel()
        friendsListModel.iconImageName = "ppt"
        friendsListModel.title = "朋友圈"
        friendsListModel.itemid = .friendsList
        friendsListModel.isHiddenline = false
        
        let videoModel = WDChatMineModel()
        videoModel.iconImageName = "ppt"
        videoModel.title = "视频号"
        videoModel.itemid = .video
        videoModel.isHiddenline = false
        
        let cardPackModel = WDChatMineModel()
        cardPackModel.iconImageName = "ppt"
        cardPackModel.title = "卡包"
        cardPackModel.itemid = .cardPack
        cardPackModel.isHiddenline = false
        
        let faceModel = WDChatMineModel()
        faceModel.iconImageName = "ppt"
        faceModel.title = "表情"
        faceModel.itemid = .face
        faceModel.isHiddenline = true
        
        
        time_3.add(collectModel)
        time_3.add(friendsListModel)
        time_3.add(videoModel)
        time_3.add(cardPackModel)
        time_3.add(faceModel)

        
        
        let time_4 = NSMutableArray()
        let setModel = WDChatMineModel()
        setModel.iconImageName = "ppt"
        setModel.title = "设置"
        setModel.itemid = .set
        setModel.isHiddenline = true
        
        time_4.add(setModel)
        
        
        temps.add(time_1)
        temps.add(time_2)
        temps.add(time_3)
        temps.add(time_4)

        
        return temps.copy() as! NSArray
    }
    
}
