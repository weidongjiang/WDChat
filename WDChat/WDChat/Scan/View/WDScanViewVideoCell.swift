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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .yellow
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
