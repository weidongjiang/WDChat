//
//  WDChatFindView.swift
//  WDChat
//
//  Created by 蒋伟东 on 2022/3/7.
//

import Foundation
import UIKit


class WDChatFindView : UIView,UITableViewDelegate,UITableViewDataSource {
    
    var tableView : UITableView!
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        initChatFindViewUI()
        
        self.tableView.reloadData()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initChatFindViewUI() {
        
        self.tableView = UITableView.init(frame: self.bounds, style: UITableView.Style.grouped)
        self.tableView.register(WDChatFindViewCell.self, forCellReuseIdentifier:WDChatFindViewCellID)
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.backgroundColor = mainColor
        self.tableView.showsVerticalScrollIndicator = false
        self.tableView.separatorStyle = .none
        self.tableView.sectionHeaderHeight = 10;
        self.tableView.sectionFooterHeight = 0.001;
        self.tableView.automaticallyAdjustsScrollIndicatorInsets = false
        self.addSubview(self.tableView)
        
        
    }
    
    // MARK: - UITableViewDelegate UITableViewDataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let headerView = UIView.init();
        headerView.backgroundColor = .red
        return headerView
        
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier:WDChatFindViewCellID, for: indexPath) as! WDChatFindViewCell
        
        return cell
        
    }
    
    
    
    
    
    
    
}
