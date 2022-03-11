//
//  WDVideoPlayView.swift
//  WDChat
//
//  Created by 蒋伟东 on 2022/3/11.
//

import Foundation
import UIKit
import AVFoundation


private let WDVideoStatusKey = "status"
private let WDVideloadedTimeRanges = "loadedTimeRanges"
private let WDVideplaybackBufferEmpty = "playbackBufferEmpty"
private let WDVideplaybackLikelyToKeepUp = "playbackLikelyToKeepUp"

class WDVideoPlayView : UIView {
    
    
    var player : AVPlayer!
    var playerItem : AVPlayerItem!
    var url : URL!
    var displayLink: CADisplayLink! // 实时刷新progress
    var pauseTime : CGFloat!

    lazy var playerView : WDPlayerView = {
        return WDPlayerView()
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setAVAudioSession()
        initDisplayLink()
        initUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.playerView.frame = self.bounds
    }
    
    
    private func initUI () {
        
        self.playerView.frame = self.bounds
        self.addSubview(self.playerView)
    }
    
    public func clean() {
        removeAllObservers()
        displayLink.invalidate()
        displayLink.remove(from: RunLoop.main, forMode: RunLoop.Mode.common)
        displayLink = nil
    }
    
    private func initDisplayLink() {
        displayLink = CADisplayLink(target: self, selector: #selector(refreshProgress))
    }
    
    @objc private func refreshProgress() {
        
        let currentTime = CMTimeGetSeconds(player.currentTime())
        let totalTime = CMTimeGetSeconds(playerItem.duration)
        print("video totalTime:\(totalTime) currentTime:\(currentTime)")
        
    }
    private func setAVAudioSession() {
        
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default, options: .defaultToSpeaker)
            try AVAudioSession.sharedInstance().setActive(true)
        }catch {
             print(error)
        }
        
    }
    
    func playWithUrl(url : URL) {
        
        
        self.url = url
        
        self.playerItem = AVPlayerItem.init(url: url)
        self.player = AVPlayer.init(playerItem: self.playerItem)
        self.playerView.player = self.player
        self.player?.volume = 0.8
        
        // 添加观察者
        addAllObservers(playerItem: self.playerItem)
        
        setAVAudioSession()
        
        playerPlay()
    }
    
    // MARK: - Play
    public func playerPlay() {
        self.player.play()
        displayLink.add(to: RunLoop.main, forMode: RunLoop.Mode.common)
    }
    // MARK: - ResumePlay
    public func playerResumePlay() {
        self.player.play()
        playerSeek(time: self.pauseTime)
        displayLink.add(to: RunLoop.main, forMode: RunLoop.Mode.common)
    }
    // MARK: - Pause
    public func playerPause() {
        self.player.pause()
        self.pauseTime = CMTimeGetSeconds(self.playerItem.currentTime())
        displayLink.invalidate()
    }
    // MARK: - SeekTo
    public func playerSeek(time : CGFloat) {
        let seekTime = CMTimeMake(value: Int64(time), timescale: 1)
        self.player.seek(to: seekTime)
        displayLink.add(to: RunLoop.main, forMode: RunLoop.Mode.common)
    }
    // MARK: - Stop
    public func playerStop() {
        playerSeek(time: 0)
        playerPause()
        displayLink.invalidate()
        removeAllObservers()
    }
    
    // MARK: - addAllObservers
    private func addAllObservers(playerItem : AVPlayerItem) {
        
        NotificationCenter.default.addObserver(self, selector: #selector(playerStateFinished(noti:)), name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: nil)
        
        playerItem.addObserver(self, forKeyPath: WDVideoStatusKey, options: .new, context: nil)
        playerItem.addObserver(self, forKeyPath: WDVideloadedTimeRanges, options: .new, context: nil)
        playerItem.addObserver(self, forKeyPath: WDVideplaybackBufferEmpty, options: .new, context: nil)
        playerItem.addObserver(self, forKeyPath: WDVideplaybackLikelyToKeepUp, options: .new, context: nil)

    }
    
    private func removeAllObservers() {
        NotificationCenter.default.removeObserver(self)
        playerItem.removeObserver(self, forKeyPath: WDVideoStatusKey)
        playerItem.removeObserver(self, forKeyPath: WDVideloadedTimeRanges)
        playerItem.removeObserver(self, forKeyPath: WDVideplaybackBufferEmpty)
        playerItem.removeObserver(self, forKeyPath: WDVideplaybackLikelyToKeepUp)
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        let _playerItem : AVPlayerItem = object as! AVPlayerItem
        if keyPath == WDVideoStatusKey {
            playerItemVideoStatus(avPlayerItem: _playerItem)
        }
        if keyPath == WDVideloadedTimeRanges {
            playerItemVideloadedTimeRanges(avPlayerItem: _playerItem)
        }
        if keyPath == WDVideplaybackBufferEmpty {
            playerItemVideplaybackBufferEmpty(avPlayerItem: _playerItem)
        }
        if keyPath == WDVideplaybackLikelyToKeepUp {
            playerItemVideplaybackLikelyToKeepUp(avPlayerItem: _playerItem)
        }
    }
    
    // 播放结束
    @objc func playerStateFinished(noti : Notification) {
        print("循环播放 playerStateFinished")
        let time = CMTimeMake(value: 0, timescale: 1)
        player.seek(to: time) { isSeek in
            print("isSeek \(isSeek)")
        }
        player.play()
    }
    
    private func playerItemVideoStatus(avPlayerItem : AVPlayerItem) {
        print("video WDVideoStatusKey")
        switch avPlayerItem.status {
        case .readyToPlay:
            print("video readyToPlay")
        case .failed:
            fallthrough
        case .unknown:
            print("video failed")
        default:
            print("video default")
        }
    }
    
    private func playerItemVideloadedTimeRanges(avPlayerItem : AVPlayerItem) {
        print("video WDVideloadedTimeRanges")

    }
    private func playerItemVideplaybackBufferEmpty(avPlayerItem : AVPlayerItem) {
        print("video WDVideplaybackBufferEmpty")

    }
    private func playerItemVideplaybackLikelyToKeepUp(avPlayerItem : AVPlayerItem) {
        print("video WDVideplaybackLikelyToKeepUp")

        
    }
    // MARK: -
    
    
    
}
