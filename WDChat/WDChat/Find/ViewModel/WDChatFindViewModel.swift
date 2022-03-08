//
//  WDChatFindViewModel.swift
//  WDChat
//
//  Created by 蒋伟东 on 2022/3/7.
//

import Foundation




class WDChatFindViewModel:NSObject {
    
    
    func creatChatFindViewData() -> NSArray {
        
        let tempArray = NSMutableArray()
        
        //
        let tempArray1 = NSMutableArray()
        let model_1_1 = WDChatFindModel()
        model_1_1.iconImageName = "ppt"
        model_1_1.title = "朋友圈"
        model_1_1.isHiddenline = true
        model_1_1.itemid = WDChatFindItemid.friendsList
        
        tempArray1.add(model_1_1)
        
        //
        let tempArray2 = NSMutableArray()
        let model_2_1 = WDChatFindModel()
        model_2_1.iconImageName = "excerl"
        model_2_1.title = "视频号"
        model_2_1.isHiddenline = false
        model_2_1.itemid = WDChatFindItemid.video

        let model_2_2 = WDChatFindModel()
        model_2_2.iconImageName = "txt"
        model_2_2.title = "直播"
        model_2_2.isHiddenline = true
        model_2_2.itemid = WDChatFindItemid.live

        tempArray2.add(model_2_1)
        tempArray2.add(model_2_2)

        
        //
        let tempArray3 = NSMutableArray()
        let model_3_1 = WDChatFindModel()
        model_3_1.iconImageName = "iconfont-wenjian"
        model_3_1.title = "扫一扫"
        model_3_1.isHiddenline = false
        model_3_1.itemid = WDChatFindItemid.sweep

        

        let model_3_2 = WDChatFindModel()
        model_3_2.iconImageName = "pdf"
        model_3_2.title = "摇一摇"
        model_3_2.isHiddenline = true
        model_3_2.itemid = WDChatFindItemid.shake

        tempArray3.add(model_3_1)
        tempArray3.add(model_3_2)
        
        //
        let tempArray4 = NSMutableArray()
        let model_4_1 = WDChatFindModel()
        model_4_1.iconImageName = "shipin"
        model_4_1.title = "看一看"
        model_4_1.isHiddenline = false
        model_4_1.itemid = WDChatFindItemid.look

        let model_4_2 = WDChatFindModel()
        model_4_2.iconImageName = "word"
        model_4_2.title = "搜一搜"
        model_4_2.isHiddenline = true
        model_4_2.itemid = WDChatFindItemid.search

        tempArray4.add(model_4_1)
        tempArray4.add(model_4_2)
        
        
        //
        let tempArray5 = NSMutableArray()
        let model_5_1 = WDChatFindModel()
        model_5_1.iconImageName = "ppt"
        model_5_1.title = "附近"
        model_5_1.isHiddenline = true
        model_5_1.itemid = WDChatFindItemid.nearby

        tempArray5.add(model_5_1)
        
        
        
        //
        let tempArray6 = NSMutableArray()
        let model_6_1 = WDChatFindModel()
        model_6_1.iconImageName = "iconfont-wenjian"
        model_6_1.title = "购物"
        model_6_1.isHiddenline = false
        model_6_1.itemid = WDChatFindItemid.shopping

        let model_6_2 = WDChatFindModel()
        model_6_2.iconImageName = "pdf"
        model_6_2.title = "游戏"
        model_6_2.isHiddenline = true
        model_6_2.itemid = WDChatFindItemid.game

        tempArray6.add(model_6_1)
        tempArray6.add(model_6_2)
        
        //
        let tempArray7 = NSMutableArray()
        let model_7_1 = WDChatFindModel()
        model_7_1.iconImageName = "shipin"
        model_7_1.title = "小程序"
        model_7_1.isHiddenline = true
        model_7_1.itemid = WDChatFindItemid.applet

        tempArray7.add(model_7_1)
        
        tempArray.add(tempArray1.copy() as! NSArray)
        tempArray.add(tempArray2.copy() as! NSArray)
        tempArray.add(tempArray3.copy() as! NSArray)
        tempArray.add(tempArray4.copy() as! NSArray)
        tempArray.add(tempArray5.copy() as! NSArray)
        tempArray.add(tempArray6.copy() as! NSArray)
        tempArray.add(tempArray7.copy() as! NSArray)

        
        return tempArray.copy() as! NSArray
    }
    
    
}
