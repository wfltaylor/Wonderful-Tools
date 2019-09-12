//
//  AppDelegate.swift
//  WonderfulTools Test Host
//
//  Created by William Taylor on 14/6/19.
//  Copyright © 2019 William Taylor. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var window: NSWindow!
    
    var screensaver = WonderfulToolsView(frame: NSRect.zero, isPreview: false)!


    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
        window.styleMask = .borderless
        window.hasShadow = false
        
        //let fullscreenPresentationOptions: NSApplication.PresentationOptions = [.hideDock, .hideMenuBar, .disableAppleMenu, .disableProcessSwitching, .disableSessionTermination, .disableHideApplication, .autoHideToolbar]
        
        let fullscreenPresentationOptions: NSApplication.PresentationOptions = [.autoHideToolbar]
        window.contentView?.enterFullScreenMode(NSScreen.main!, withOptions: [NSView.FullScreenModeOptionKey.fullScreenModeApplicationPresentationOptions: fullscreenPresentationOptions])
        window.contentView?.wantsLayer = true
        
        screensaver.frame = window.contentView?.bounds ?? CGRect.zero
        window.contentView?.addSubview(screensaver)
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
    
    func mouseMovementDetected(sender: Any) {
        
    }

}
