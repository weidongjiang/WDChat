//
//  WDPlayerView.swift
//  WDChat
//
//  Created by 蒋伟东 on 2022/3/11.
//

import Foundation
import UIKit
import AVFoundation


class WDPlayerView : UIView {
    
    override class var layerClass: AnyClass {
        get {
            return AVPlayerLayer.self
        }
    }
    
    var player : AVPlayer {
        get {
            let layer = self.layer as! AVPlayerLayer
            return layer.player!
        }
        set {
            let layer = self.layer as! AVPlayerLayer
            layer.player = newValue
        }
        
    }
    
}
