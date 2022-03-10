//
//  WDScanViewController.swift
//  WDChat
//
//  Created by 蒋伟东 on 2022/3/9.
//

import Foundation
import UIKit
import RxCocoa

class WDScanViewController : WDBaseViewController,
                             UICollectionViewDelegate,
                             UICollectionViewDataSource {
    
    
    
    lazy var dataArray : NSMutableArray = {
        return NSMutableArray()
    }()
    
    lazy var viewModel : WDScanViewModel = {
        return WDScanViewModel()
    }()
    
    lazy var collectionView : UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0;
        layout.minimumInteritemSpacing = 0;
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: KWDChatScreenWidth, height: KWDChatScreenHeight)
        
        let collectionView = UICollectionView.init(frame: CGRect(x: 0, y: 0, width: KWDChatScreenWidth, height: KWDChatScreenHeight), collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = false
        collectionView.bounces = false
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.contentInsetAdjustmentBehavior = .never
        collectionView.register(WDScanViewImageCell.self, forCellWithReuseIdentifier: WDScanViewImageCellID)
        collectionView.register(WDScanViewVideoCell.self, forCellWithReuseIdentifier: WDScanViewVideoCellID)

        
        return collectionView
        
    }()
    
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.isHidden = true
        self.tabBarController?.tabBar.isHidden = true
        
        
        self.view.backgroundColor = UIColor.wd_colorWithHexString(hex: "#000000", alpha: 1.0)
        
        self.view.addSubview(collectionView)
        
        
        let datas = viewModel.getTempDatas()
        for item in datas {
            self.dataArray.add(item)
        }
        collectionView.reloadData()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = false

        
        
    }
    
    
    
    // MARK: - UICollectionViewDelegate UICollectionViewDataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.dataArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let model = self.dataArray[indexPath.item] as! WDScanModel
        
        if model.itemType == .image {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: WDScanViewImageCellID, for: indexPath)
            
            return cell
            
        }else if model.itemType == .video {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: WDScanViewVideoCellID, for: indexPath)
            
            return cell
        }
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        return cell

    }
}
