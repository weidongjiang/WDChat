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
        
        
        let model_2 = WDScanModel()
        model_2.itemType = .video
        
        
        temps.add(model_2)
        temps.add(model_1)

        return temps.copy() as! NSArray
    }
    
}
