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
    
    var model: WDChatFindModel? {
        set {
            self.iconImageView.image = UIImage.init(named: newValue!.iconImageName)
            self.titleLabel.text = newValue!.title
            
        }
        get {
            return self.model
        }
    }
    
    
    var iconImageView:UIImageView!
    var titleLabel:UILabel!
    var arrowImageView:UIImageView!
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.selectionStyle = .none
        
        initFindViewUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func initFindViewUI() {
        
        self.backgroundColor = UIColor.wd_colorWithHexString(hex: "#ffffff", alpha: 1.0)
        
        self.iconImageView = UIImageView()
        self.iconImageView.layer.cornerRadius = 2
        self.iconImageView.layer.masksToBounds = true
        self.contentView.addSubview(self.iconImageView)
        self.iconImageView.snp.makeConstraints { make in
            make.centerY.equalTo(self.contentView)
            make.left.equalTo(self.contentView).offset(10)
            make.width.height.equalTo(40)
        }
        
        
        self.titleLabel = UILabel()
        self.titleLabel.font = UIFont.systemFont(ofSize: 14)
        self.titleLabel.textColor = UIColor.wd_colorWithHexString(hex: "#999999", alpha: 1.0)
        self.contentView.addSubview(self.titleLabel)
        self.titleLabel.snp.makeConstraints { make in
            make.centerY.equalTo(self.iconImageView)
            make.left.equalTo(self.iconImageView.snp.right).offset(10)
        }
        
        self.arrowImageView = UIImageView()
        self.arrowImageView.image = UIImage.init(named: "App_rightArrow")
        self.contentView.addSubview(self.arrowImageView)
        self.arrowImageView.snp.makeConstraints { make in
            make.centerY.equalTo(self.iconImageView)
            make.right.equalTo(self.contentView).offset(-10)
            make.width.equalTo(7.5)
            make.height.equalTo(12.5)
        }
        
    }
}
