//
//  WDChatMessageView.swift
//  WDChat
//
//  Created by 蒋伟东 on 2022/3/3.
//

import Foundation
import UIKit

class WDChatMessageView: UIView {
    
    var tableView : UITableView!
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        initUI()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func initUI() {
        
        tableView = UITableView.init(frame: self.bounds, style: UITableView.Style.plain)
        tableView.backgroundColor = .red
        
        self.addSubview(tableView)
    }
    
}
