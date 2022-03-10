//
//  WDScanViewImageCell.swift
//  WDChat
//
//  Created by 蒋伟东 on 2022/3/10.
//



import Foundation
import UIKit


let WDScanViewImageCellID = "WDScanViewImageCellID"


class WDScanViewImageCell : UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.contentView.backgroundColor = .red
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
