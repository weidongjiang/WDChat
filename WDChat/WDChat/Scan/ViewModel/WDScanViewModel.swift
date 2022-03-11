//
//  WDScanViewModel.swift
//  WDChat
//
//  Created by 蒋伟东 on 2022/3/9.
//

import Foundation

class WDScanViewModel : NSObject {
    
    
    override init() {
        super.init()
    
    }
    
    
    func getTempDatas() -> NSArray {
        
        let temps = NSMutableArray()
        
        let model_1 = WDScanModel()
        model_1.itemType = .image
        model_1.imageUrlString = "http://medocdn.huoying666.com/images/20210918/4c259bcc1621c2afb78ee24777232fd9/4c259bcc16.jpg"
        
        let model_2 = WDScanModel()
        model_2.itemType = .video
        model_2.imageUrlString = "http://medocdn.huoying666.com/images/20210918/4c259bcc1621c2afb78ee24777232fd9/4c259bcc16.jpg"
        model_2.videoPlayUrlString = "http://medocdn.huoying666.com/videos/20220310/feccae1d65648e2ad9b0c77a5a557084/feccae1d65.mp4"
        
        temps.add(model_2)
        temps.add(model_1)

        return temps.copy() as! NSArray
    }
    
}
