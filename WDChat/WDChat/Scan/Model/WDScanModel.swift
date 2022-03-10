//
//  WDScanModel.swift
//  WDChat
//
//  Created by 蒋伟东 on 2022/3/9.
//

import Foundation
import SwiftUI

enum WDScanType {
    case image
    case video
}

class WDScanModel : NSObject {
    
    var itemType : WDScanType!
    var imageUrlString : String!
    var videoPlayUrlString : String!
    var videoPlayCoverUrlString : String!

    
    override init() {
        super.init()
        
        
    }
    
}
