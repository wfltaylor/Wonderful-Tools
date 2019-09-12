//
//  WonderfulToolsView.swift
//  WonderfulTools
//
//  Created by William Taylor on 14/6/19.
//  Copyright © 2019 William Taylor. All rights reserved.
//

import ScreenSaver
import AVKit

//MARK: - WonderfulToolsView
class WonderfulToolsView: ScreenSaverView {
    
    //MARK: Properties
    
    private let videoLayer = AVPlayerLayer()
    
    private let player = WonderfulToolsPlayer(video: Videos.mainVideo)
    
    //MARK: Initialization
    
    override init?(frame: NSRect, isPreview: Bool) {
        super.init(frame: frame, isPreview: isPreview)
        animationTimeInterval = 1 / 30.0
        setup()
    }
    
    required init?(coder decoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Setup
    
    func setup() {
        setupLayer()
    }
    
    func setupLayer() {
        videoLayer.videoGravity = .resizeAspectFill
        videoLayer.backgroundColor = CGColor.black
        
        layer = videoLayer
        
        videoLayer.player = player
        videoLayer.player?.play()
    }
    
    //MARK: Lifecycle
    
    override func startAnimation() {
        super.startAnimation()
    }
    
    override func stopAnimation() {
        super.stopAnimation()
    }
    
    override func animateOneFrame() {
        return
    }
    
    override var hasConfigureSheet: Bool {
        return false
    }
    
    override var configureSheet: NSWindow? {
        return nil
    }
}
