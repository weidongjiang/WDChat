//
//  WDScanViewVideoCell.swift
//  WDChat
//
//  Created by 蒋伟东 on 2022/3/10.
//

import Foundation
import UIKit

let WDScanViewVideoCellID = "WDScanViewVideoCellID"

class WDScanViewVideoCell : UICollectionViewCell {
    
    var videoPlayView : WDVideoPlayView!
    
    var model : WDScanModel?
    var videoModel : WDScanModel? {
        set {
            model = newValue
            
            let url = URL(string: newValue?.videoPlayUrlString ?? "")
            videoPlayView.playWithUrl(url: url!)
            
        }
        get {
            return model
        }
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.wd_colorWithHexString(hex: "000000", alpha: 1.0)
        
        self.videoPlayView = WDVideoPlayView(frame: CGRect(x: 0, y: 0, width: KWDChatScreenWidth, height: KWDChatScreenHeight))
        self.contentView.addSubview(self.videoPlayView)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
