//
//  WDChatMessageView.swift
//  WDChat
//
//  Created by 蒋伟东 on 2022/3/3.
//

import Foundation
import UIKit

class WDChatMessageView: UIView,UITableViewDelegate,UITableViewDataSource {
    
    var tableView : UITableView!
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        initUI()
        
        self.tableView.reloadData()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func initUI() {
        
        self.tableView = UITableView.init(frame: self.bounds, style: UITableView.Style.plain)
        self.tableView.register(WDChatMessageViewCell.self, forCellReuseIdentifier:WDChatMessageViewCellID)
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.backgroundColor = .red
        self.tableView.bounces = false
        self.tableView.showsVerticalScrollIndicator = false
        self.tableView.separatorStyle = .none
        self.addSubview(self.tableView)
    }
    
    
    // MARK - UITableViewDelegate UITableViewDataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.1
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier:WDChatMessageViewCellID, for: indexPath) as! WDChatMessageViewCell
        
        return cell
        
    }
    
    
}
