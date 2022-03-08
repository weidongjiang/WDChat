//
//  WDChatMineViewHeaderCell.swift
//  WDChat
//
//  Created by 蒋伟东 on 2022/3/8.
//

import Foundation
import UIKit

let WDChatMineViewHeaderCellID = "WDChatMineViewHeaderCellID"

class WDChatMineViewHeaderCell:UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        initMineViewHeaderCellUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func initMineViewHeaderCellUI() {
        
        self.backgroundColor = .white
        
    }
    
}
