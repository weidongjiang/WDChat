//
//  WDScanViewImageCell.swift
//  WDChat
//
//  Created by 蒋伟东 on 2022/3/10.
//



import Foundation
import UIKit


let WDScanViewImageCellID = "WDScanViewImageCellID"


class WDScanViewImageCell : UICollectionViewCell,
                            UIScrollViewDelegate {
    
    var imageView : UIImageView!
    var scrollView : UIScrollView!
    
    var model : WDScanModel?
    var imageModel : WDScanModel? {
        set {
            model = newValue
            
            let url = URL(string: newValue?.imageUrlString ?? "")
            imageView.kf.setImage(with: url, placeholder: nil, options: nil, completionHandler: nil)
        }
        get {
            return model
        }
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.contentView.backgroundColor = UIColor.wd_colorWithHexString(hex: "#000000", alpha: 1.0)
        
        initScanViewImageCellUI()
        
        addtap()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addtap() {
        
        let signlTap = UITapGestureRecognizer(target: self, action: #selector(scrollViewDidTap))
        let doubleTap = UITapGestureRecognizer(target: self, action: #selector(scrollViewDidDoubleTap))
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(scrollViewLongPress))
        
        signlTap.numberOfTapsRequired = 1
        signlTap.numberOfTouchesRequired = 1
        doubleTap.numberOfTapsRequired = 2
        doubleTap.numberOfTouchesRequired = 1
        
        signlTap.require(toFail: doubleTap)
        
        imageView.addGestureRecognizer(signlTap)
        imageView.addGestureRecognizer(doubleTap)
        imageView.addGestureRecognizer(longPress)

    }
    
    @objc func scrollViewLongPress(longPress : UILongPressGestureRecognizer) {
        print("scrollViewLongPress")

    }
    
    @objc func scrollViewDidDoubleTap(tap : UITapGestureRecognizer) {
        print("scrollViewDidDoubleTap")
        if scrollView.zoomScale <= 1 {
            scrollView.setZoomScale(2.5, animated: true)
        }else {
            scrollView.setZoomScale(1, animated: true)
        }
    }
    
    @objc func scrollViewDidTap(tap : UITapGestureRecognizer) {
        print("scrollViewDidTap")
        
    }
    
    func initScanViewImageCellUI() {
        
        scrollView = UIScrollView()
        scrollView.clipsToBounds = true
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.showsVerticalScrollIndicator = false
        scrollView.bounces = false
        scrollView.contentInsetAdjustmentBehavior = .never
        scrollView.zoomScale = 1.0
        scrollView.minimumZoomScale = 1.0
        scrollView.maximumZoomScale = 20
        scrollView.delegate = self
        scrollView.isUserInteractionEnabled = true
        self.contentView.addSubview(scrollView)
        scrollView.snp.makeConstraints { make in
            make.left.top.equalTo(self.contentView)
            make.width.equalTo(KWDChatScreenWidth)
            make.height.equalTo(KWDChatScreenHeight)
        }
        
        
        imageView = UIImageView()
        imageView.isUserInteractionEnabled = true
        imageView.contentMode = .scaleAspectFit
        scrollView.addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.left.top.equalTo(self.scrollView)
            make.width.equalTo(KWDChatScreenWidth)
            make.height.equalTo(KWDChatScreenHeight)
        }
        
        
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
    
    func scrollViewDidZoom(_ scrollView: UIScrollView) {
        self.imageView.center = setScrollViewDidZoomImageViewCenter()
    }
    
    func setScrollViewDidZoomImageViewCenter() -> CGPoint {
        
        let offsetX = (scrollView.bounds.size.width > scrollView.contentSize.width) ?
        (scrollView.bounds.size.width - scrollView.contentSize.width) * 0.5 : 0.0;
                
        let offsetY = (scrollView.bounds.size.height > scrollView.contentSize.height) ?
        (scrollView.bounds.size.height - scrollView.contentSize.height) * 0.5 : 0.0;
        
        let actualCenter = CGPoint(x: scrollView.contentSize.width * 0.5 + offsetX, y: scrollView.contentSize.height * 0.5 + offsetY)
        
        return actualCenter;
        
    }
    
    
}
