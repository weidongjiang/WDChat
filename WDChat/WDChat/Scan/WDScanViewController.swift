//
//  WDScanViewController.swift
//  WDChat
//
//  Created by 蒋伟东 on 2022/3/9.
//

import Foundation
import UIKit
import RxCocoa

class WDScanViewController : WDBaseViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.title = ""
        self.navigationController?.navigationBar.isHidden = true
        self.tabBarController?.tabBar.isHidden = true
        
        self.view.backgroundColor = UIColor.wd_colorWithHexString(hex: "#000000", alpha: 1.0)
        
        let scanView = WDScanView(frame: CGRect(x: 0, y: 0, width: KWDChatScreenWidth, height: KWDChatScreenHeight))
        self.view.addSubview(scanView)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = false

        
        
    }
    
    
    
    
}
