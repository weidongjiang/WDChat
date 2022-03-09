//
//  WDChatMineViewHeaderCell.swift
//  WDChat
//
//  Created by 蒋伟东 on 2022/3/8.
//

import Foundation
import UIKit
import SnapKit
import Kingfisher

let WDChatMineViewHeaderCellID = "WDChatMineViewHeaderCellID"

class WDChatMineViewHeaderCell : UITableViewCell {
    
    typealias avaterDidBlock = (WDChatMineModel) -> Void
    
    var iconAvaterDidBlock : avaterDidBlock?
    
    var headerModel : WDChatMineModel? {
        set {
            
            let url = URL(string: newValue?.iconAvaterUrlString ?? "")
            self.iconAvaterImageView.kf.setImage(with: url, placeholder: UIImage.init(named: "usericon_default"), options: nil, completionHandler: nil)

            self.nameLabel.text = newValue?.chatName
            let chatid = newValue?.chatid ?? ""
            self.chatidLabel.text = "微信号：" + chatid
            
        }
        get {
            return self.headerModel
        }
    }
    
    var iconAvaterImageView : UIImageView!
    var nameLabel : UILabel!
    var chatidLabel : UILabel!
    var arrowButton : UIButton!
    var addStatusButton : UIButton!
    
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        initMineViewHeaderCellUI()
        
        
        let tap = UITapGestureRecognizer()
        tap.addTarget(self, action: #selector(iconAvaterTap))
        self.iconAvaterImageView.addGestureRecognizer(tap)

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func initMineViewHeaderCellUI() {
        
        self.backgroundColor = .white
        
        self.iconAvaterImageView = UIImageView()
        self.iconAvaterImageView.layer.cornerRadius = 4
        self.iconAvaterImageView.layer.masksToBounds = true
        self.iconAvaterImageView.isUserInteractionEnabled = true
        self.contentView.addSubview(self.iconAvaterImageView)
        self.iconAvaterImageView.snp.makeConstraints { make in
            make.left.equalTo(self.contentView).offset(20)
            make.width.height.equalTo(60)
            make.bottom.equalTo(self.contentView).offset(-30)
        }
        
        self.nameLabel = UILabel()
        self.nameLabel.textColor = UIColor.wd_colorWithHexString(hex: "#000000", alpha: 1.0)
        self.nameLabel.font = UIFont.boldSystemFont(ofSize: 22)
        self.contentView.addSubview(self.nameLabel)
        self.nameLabel.snp.makeConstraints { make in
            make.top.equalTo(self.iconAvaterImageView)
            make.left.equalTo(self.iconAvaterImageView.snp.right).offset(10)
            make.right.equalTo(self.contentView).offset(-20)
        }
        
        self.arrowButton = UIButton()
        self.arrowButton.setImage(UIImage.init(named: "App_rightArrow"), for: UIControl.State.normal)
        self.contentView.addSubview(self.arrowButton)
        
        self.chatidLabel = UILabel()
        self.chatidLabel.textColor = UIColor.wd_colorWithHexString(hex: "#000000", alpha: 0.6)
        self.chatidLabel.font = UIFont.systemFont(ofSize: 20)
        self.contentView.addSubview(self.chatidLabel)
        self.chatidLabel.snp.makeConstraints { make in
            make.left.equalTo(self.nameLabel)
            make.bottom.equalTo(self.iconAvaterImageView)
            make.right.lessThanOrEqualTo(self.arrowButton.snp.left).offset(-5)
        }
        
        self.arrowButton.snp.makeConstraints { make in
            make.centerY.equalTo(self.chatidLabel)
            make.right.equalTo(self.contentView).offset(-20)
            make.width.equalTo(7.5)
            make.height.equalTo(12.5)
        }
        
        self.addStatusButton = UIButton()
        self.addStatusButton.setImage(UIImage.init(named: "圆角矩形-1"), for: UIControl.State.normal)
        self.addStatusButton.setTitle("状态", for: UIControl.State.normal)
        self.addStatusButton.setTitleColor(UIColor.wd_colorWithHexString(hex: "#999999", alpha: 1.0), for: UIControl.State.normal)
        self.addStatusButton.layer.masksToBounds = true
        self.addStatusButton.layer.cornerRadius = 10
        self.addStatusButton.layer.borderWidth = 1
        self.addStatusButton.layer.borderColor = UIColor.wd_colorWithHexString(hex: "#999999", alpha: 1.0).cgColor
        self.addStatusButton.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        self.addStatusButton.titleLabel?.textAlignment = .center
        self.contentView.addSubview(self.addStatusButton)
        self.addStatusButton.snp.makeConstraints { make in
            make.left.equalTo(self.nameLabel)
            make.top.equalTo(self.chatidLabel.snp.bottom).offset(4)
            make.width.equalTo(50)
            make.height.equalTo(20)
        }
        
        self.addStatusButton.imageView!.snp.makeConstraints { make in
            make.top.left.equalTo(self.addStatusButton)
            make.width.height.equalTo(20)
        }
        self.addStatusButton.titleLabel!.snp.makeConstraints { make in
            make.top.right.equalTo(self.addStatusButton)
            make.width.height.equalTo(20)
        }
    }
    
    
    @objc func iconAvaterTap() {
//        iconAvaterDidBlock!(headerModel!)
    }
}
