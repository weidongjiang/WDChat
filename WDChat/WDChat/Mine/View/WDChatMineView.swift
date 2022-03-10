//
//  WDChatMineView.swift
//  WDChat
//
//  Created by 蒋伟东 on 2022/3/8.
//

import Foundation
import UIKit


typealias WDChatMineViewAvaterDidBlock = (WDChatMineModel,UIImageView) -> Void


class WDChatMineView:UIView,UITableViewDelegate,UITableViewDataSource {
    
    var mineViewAvaterDidBlock : WDChatMineViewAvaterDidBlock?
    
    var tableView : UITableView!
    var viewModel : WDChatMineViewModel! {
        get {
            return WDChatMineViewModel()
        }
    }
    var dataArray : NSMutableArray!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.dataArray = NSMutableArray()

        initChatMineViewUI()
        
        getChatMineData()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func getChatMineData() {
        
        let data = self.viewModel!.getChatMineViewData()
        
        for item in data {
            self.dataArray.add(item)
        }
        
        self.tableView.reloadData()
    }
    
    func initChatMineViewUI() {
        
        self.backgroundColor = .white
        
        
        self.tableView = UITableView.init(frame: self.bounds, style: UITableView.Style.grouped)
        self.tableView.register(WDChatMineViewCell.self, forCellReuseIdentifier:WDChatMineViewCellID)
        self.tableView.register(WDChatMineViewHeaderCell.self, forCellReuseIdentifier:WDChatMineViewHeaderCellID)
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.backgroundColor = mainColor
        self.tableView.showsVerticalScrollIndicator = false
        self.tableView.separatorStyle = .none
        self.tableView.sectionHeaderHeight = 10;
        self.tableView.sectionFooterHeight = 0.001;
        self.tableView.automaticallyAdjustsScrollIndicatorInsets = false
        self.tableView.contentInset = UIEdgeInsets.init(top: -KWDNavBarHeight, left: 0, bottom: 0, right: 0)
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
        if indexPath.section == 0 {
            return 200
        }
        return 50
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            return nil
        }
        let headerView = UIView.init();
        headerView.backgroundColor = mainColor
        return headerView
        
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let rows:NSArray = self.dataArray[indexPath.section] as! NSArray
        let model:WDChatMineModel = rows[indexPath.row] as! WDChatMineModel
        
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier:WDChatMineViewHeaderCellID, for: indexPath) as! WDChatMineViewHeaderCell
            cell.headerModel = model
            
            cell.iconAvaterDidBlock = { [weak self] (mineModel,avaterImageView) -> Void in
                self?.mineViewAvaterDidBlock!(mineModel,avaterImageView);
            }
            return cell
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier:WDChatMineViewCellID, for: indexPath) as! WDChatMineViewCell
        cell.model = model
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let rows:NSArray = self.dataArray[indexPath.section] as! NSArray
        let model:WDChatMineModel = rows[indexPath.row] as! WDChatMineModel
        
//        switch model.itemid {
//        case WDChatFindItemid_1_1:
//            print(WDChatFindItemid_1_1)
//        case WDChatFindItemid_2_1:
//            print(WDChatFindItemid_2_1)
//            print(WDChatFindItemid_2_1)
//
//        case WDChatFindItemid_2_2:
//            print(WDChatFindItemid_2_2)
//
//        default:
//            print(WDChatFindItemid_2_2)
//
//        }
        
    }
    
    
    
    
}
