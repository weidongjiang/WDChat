//
//  WDChatMessageViewModel.swift
//  WDChat
//
//  Created by 蒋伟东 on 2022/3/7.
//

import Foundation


class WDChatMessageViewModel:NSObject {
    
    override init() {
        super.init()
        
//        crateMessageData()
    }
    
    
    func crateMessageData() -> NSArray {
        
        let tempArray = NSMutableArray()
        
        let model1 = WDChatMessageModel()
        model1.iconAvater = "http://medocdn.huoying666.com/images/20210918/4c259bcc1621c2afb78ee24777232fd9/4c259bcc16.jpg"
        model1.name = "kk"
        model1.time = "03-07 12:12"
        model1.message = "回家时"
        
        
        let model2 = WDChatMessageModel()
        model2.iconAvater = "http://medocdn.huoying666.com/images/20210918/4c259bcc1621c2afb78ee24777232fd9/4c259bcc16.jpg"
        model2.name = "kk model2"
        model2.time = "03-07 12:12"
        model2.message = "回家时"
        
        let model3 = WDChatMessageModel()
        model3.iconAvater = "http://medocdn.huoying666.com/images/20210918/4c259bcc1621c2afb78ee24777232fd9/4c259bcc16.jpg"
        model3.name = "kk model3"
        model3.time = "03-07 12:12"
        model3.message = "回家时"
        
        let model4 = WDChatMessageModel()
        model4.iconAvater = "http://medocdn.huoying666.com/images/20210918/4c259bcc1621c2afb78ee24777232fd9/4c259bcc16.jpg"
        model4.name = "kk model4"
        model4.time = "03-07 12:12"
        model4.message = "回家时"
        
        let model5 = WDChatMessageModel()
        model5.iconAvater = "http://medocdn.huoying666.com/images/20210918/4c259bcc1621c2afb78ee24777232fd9/4c259bcc16.jpg"
        model5.name = "kk model5"
        model5.time = "03-07 12:12"
        model5.message = "回家时"
        
        
        tempArray.add(model1)
        tempArray.add(model2)
        tempArray.add(model3)
        tempArray.add(model4)
        tempArray.add(model5)

        return tempArray.copy() as! NSArray
    }
    
}
