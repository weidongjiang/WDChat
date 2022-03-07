//
//  WDChatFindViewCell.swift
//  WDChat
//
//  Created by 蒋伟东 on 2022/3/7.
//

import Foundation
import UIKit


let WDChatFindViewCellID = "WDChatFindViewCellID"


class WDChatFindViewCell: UITableViewCell {
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        
        initFindViewUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func initFindViewUI() {
        
        self.backgroundColor = UIColor.wd_colorWithHexString(hex: "#000000", alpha: 1.0)
        
        
    }
}
