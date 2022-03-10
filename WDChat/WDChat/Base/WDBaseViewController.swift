//
//  WDBaseViewController.swift
//  WDChat
//
//  Created by 蒋伟东 on 2022/3/2.
//

import Foundation
import UIKit

class WDBaseViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.view.backgroundColor = mainColor
        
        addNavLeftButton()
        
    }
    
    
    func addNavLeftButton() {
        
        let leftBtn = UIButton()
        leftBtn.setImage(UIImage.init(named: "white_back"), for: UIControl.State.normal)
        leftBtn.setImage(UIImage.init(named: "white_back"), for: UIControl.State.selected)
        leftBtn.sizeToFit()
        leftBtn.addTarget(self, action: #selector(dismissBlack), for: UIControl.Event.touchUpInside)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: leftBtn)
    }
    
    @objc func dismissBlack() -> Void {
        
        if self.navigationController == nil {
            self.dismiss(animated: true, completion: nil)
            return
        }
        
        if self.navigationController?.viewControllers.count == 1 && self.navigationController?.viewControllers[0] == self {
            self.dismiss(animated: true, completion: nil)
        }else {
            self.navigationController?.popViewController(animated: true)
        }
    }
}
