//
//  WDChatMessageViewCell.swift
//  WDChat
//
//  Created by 蒋伟东 on 2022/3/3.
//

import Foundation
import UIKit
import SnapKit
import Kingfisher

let WDChatMessageViewCellID = "WDChatMessageViewCellID"


class WDChatMessageViewCell: UITableViewCell {
    
    var _model : WDChatMessageModel?
    var model : WDChatMessageModel? {
        set {
            _model = newValue
            
            self.nameLabel.text = newValue?.name
            self.timeLabel.text = newValue?.time
            self.messageLabel.text = newValue?.message
            
            let url = URL(string: newValue?.iconAvater ?? "")
            self.iconImageView.kf.setImage(with: url, placeholder: UIImage.init(named: "usericon_default"), options: nil, progressBlock: nil, completionHandler: nil)
        }
        get {
            return _model
        }
    }
    
    let iconImage_w_h = 40
    let iconImage_m = 10
    
    var iconImageView : UIImageView!
    var nameLabel : UILabel!
    var messageLabel : UILabel!
    var timeLabel : UILabel!
    var lineView : UIView!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        initUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func initUI() {
        
        self.contentView.backgroundColor = .white
        
        self.iconImageView = UIImageView.init()
        self.iconImageView.layer.cornerRadius = 2
        self.iconImageView.layer.masksToBounds = true
        self.iconImageView.backgroundColor = .white
        self.contentView.addSubview(self.iconImageView)
        self.iconImageView.snp.makeConstraints { make in
            make.left.equalTo(self.contentView).offset(iconImage_m)
            make.centerY.equalTo(self.contentView)
            make.width.height.equalTo(iconImage_w_h)
        }
        
        
        self.timeLabel = UILabel.init()
        self.timeLabel.textColor = UIColor.gray
        self.timeLabel.font = UIFont.systemFont(ofSize: 14)
        self.contentView.addSubview(self.timeLabel)
        self.timeLabel.snp.makeConstraints { make in
            make.top.equalTo(self.iconImageView)
            make.right.equalTo(self.contentView).offset(-iconImage_m)
        }
        
        self.nameLabel = UILabel.init()
        self.nameLabel.textColor = UIColor.black
        self.nameLabel.font = UIFont.systemFont(ofSize: 16)
        self.contentView.addSubview(self.nameLabel)
        self.nameLabel.snp.makeConstraints { make in
            make.top.equalTo(self.iconImageView)
            make.left.equalTo(self.iconImageView.snp.right).offset(iconImage_m)
            make.right.lessThanOrEqualTo(self.timeLabel.snp.left).offset(-iconImage_m)
        }
        
        
        
        self.messageLabel = UILabel.init()
        self.messageLabel.textColor = UIColor.gray
        self.messageLabel.font = UIFont.systemFont(ofSize: 14)
        self.contentView.addSubview(self.messageLabel)
        self.messageLabel.snp.makeConstraints { make in
            make.bottom.equalTo(self.iconImageView)
            make.left.equalTo(self.iconImageView.snp.right).offset(iconImage_m)
            make.right.equalTo(self.contentView).offset(-iconImage_m)
        }
        
        self.lineView = UIView.init()
        self.lineView.backgroundColor = mainColor
        self.contentView.addSubview(self.lineView)
        self.lineView.snp.makeConstraints { make in
            make.left.equalTo(self.nameLabel)
            make.bottom.right.equalTo(self.contentView)
            make.height.equalTo(0.5)
        }
        
        
        
    }
    
    
}
