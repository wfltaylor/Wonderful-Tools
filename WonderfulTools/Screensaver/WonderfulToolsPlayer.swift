//
//  WonderfulToolsPlayer.swift
//  WonderfulTools
//
//  Created by William Taylor on 15/6/19.
//  Copyright © 2019 William Taylor. All rights reserved.
//

import Foundation
import AVKit

// MARK: - WonderfulToolsPlayer
class WonderfulToolsPlayer: AVQueuePlayer {
    
    //MARK: Properties
    
    //MARK: Initialization
    
    convenience init(video: String) {
        guard let itemURL = Bundle(for: WonderfulToolsPlayer.self).url(forResource: video, withExtension: nil) else { self.init(items: [AVPlayerItem]()); return }
        var items: [AVPlayerItem] = [AVPlayerItem(url: itemURL)]
        
        
        //we can't loop with an item array with 1 item
        if items.count == 1, let duplicateItem = items.first?.copy() as? AVPlayerItem {
            items.append(duplicateItem)
        }
        
        self.init(items: items)
        setupNotifications()
    }
    
    //MARK: Deinitialization
    
    deinit {
        removeNotifications()
    }
    
    //MARK: Notifications
    
    func setupNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(itemDidPlayToEndTime), name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: nil)
    }
    
    func removeNotifications() {
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: nil)
    }
    
    @objc
    func itemDidPlayToEndTime() {
        guard let duplicateItem = currentItem?.copy() as? AVPlayerItem else { return }
        insert(duplicateItem, after: items().last)
    }
}
