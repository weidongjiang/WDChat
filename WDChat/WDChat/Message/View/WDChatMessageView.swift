//
//  WDChatMessageView.swift
//  WDChat
//
//  Created by 蒋伟东 on 2022/3/3.
//

import Foundation
import UIKit
import CoreMedia

class WDChatMessageView: UIView,UITableViewDelegate,UITableViewDataSource {
    
    var tableView : UITableView!
    var viewModel : WDChatMessageViewModel? {
        get {
            return WDChatMessageViewModel()
        }
    }
    var dataArray : NSMutableArray!

    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        initChatMessageViewUI()
        
        self.dataArray = NSMutableArray()
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func updateChatMessageData() {
        
        let tempData = self.viewModel?.crateMessageData()
        
        self.dataArray.removeAllObjects()
        
        URLAPI.shared.getDataimgRank(URLAPI.shared.imgRank) { result, resultStatus in
//            print(resultStatus)
//            print(result)
            var datas = Array<WDChatMessageModel>()
            
            for item in result as! [Item]  {
                var model = WDChatMessageModel()
                model.name = item.user.login
                model.message = item.content
                model.time = item.id
                model.iconAvater = item.user.thumb
                
                datas.append(model)
            }
            self.dataArray.addObjects(from: datas)
            self.tableView.reloadData()
            
        }

    }
    
    
    func initChatMessageViewUI() {
        
        self.tableView = UITableView.init(frame: self.bounds, style: UITableView.Style.plain)
        self.tableView.register(WDChatMessageViewCell.self, forCellReuseIdentifier:WDChatMessageViewCellID)
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.backgroundColor = .white
        self.tableView.bounces = false
        self.tableView.showsVerticalScrollIndicator = false
        self.tableView.separatorStyle = .none
        self.addSubview(self.tableView)
    }
    
    
    // MARK: - UITableViewDelegate UITableViewDataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataArray.count
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
        
        let model = self.dataArray[indexPath.row]
        
        cell.model = model as? WDChatMessageModel;
        
        return cell
        
    }
    
    
}
