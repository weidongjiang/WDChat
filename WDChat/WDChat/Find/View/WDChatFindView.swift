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
    var viewModel : WDChatFindViewModel! {
        get {
            return WDChatFindViewModel()
        }
    }
    var dataArray : NSMutableArray!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        initChatFindViewUI()
        
        self.dataArray = NSMutableArray()
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func getChatFindViewData() {
        
        let temps = self.viewModel!.creatChatFindViewData()
        
        for obj in temps {
            self.dataArray.add(obj)
        }
        
        self.tableView.reloadData()
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
        return self.dataArray.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let rows = self.dataArray[section] as! [NSArray]
        return rows.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let headerView = UIView.init();
        headerView.backgroundColor = mainColor
        return headerView
        
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier:WDChatFindViewCellID, for: indexPath) as! WDChatFindViewCell
        
        let rows:NSArray = self.dataArray[indexPath.section] as! NSArray
        let model:WDChatFindModel = rows[indexPath.row] as! WDChatFindModel
        
        cell.model = model
        
        return cell
        
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let rows:NSArray = self.dataArray[indexPath.section] as! NSArray
        let model:WDChatFindModel = rows[indexPath.row] as! WDChatFindModel
        
        switch model.itemid {
        case WDChatFindItemid_1_1:
            print(WDChatFindItemid_1_1)
        case WDChatFindItemid_2_1:
            print(WDChatFindItemid_2_1)

        case WDChatFindItemid_2_2:
            print(WDChatFindItemid_2_2)

        default:
            print(WDChatFindItemid_2_2)

        }
        
    }
    
    
    
    
}
