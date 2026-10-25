//
//  AppDelegate.swift
//  Little Fingers
//
//  Created by Shaun Inman on 2/3/17.
//  Copyright © 2017 Shaun Inman. All rights reserved.
//

import Cocoa

let SINotificationLockChanged = "SINotificationLockChanged"

@main
class AppDelegate: NSObject, NSApplicationDelegate {

	var tapController:TapController!
	var statusItemController:StatusItemController!

	func applicationDidFinishLaunching(_ aNotification: Notification) {
		NSApplication.shared.setActivationPolicy(.accessory)
		
		let defaults = UserDefaults.standard
		defaults.register(defaults: ["autoLaunch": true,
		                             "firstRun": true])
		
		if defaults.bool(forKey: "firstRun") {
			defaults.set(false, forKey: "firstRun")
			LoginItems.addApp()
		}
		
		// Only create the keyboard taps once Accessibility is granted; creating them
		// without permission fails. StatusItemController prompts for permission
		// and relaunches the app once it's granted.
		if TapController.isAccessibilityEnabled() {
			tapController = TapController()
		}
		statusItemController = StatusItemController()
	}

	func applicationWillTerminate(_ aNotification: Notification) {
		
	}

	func applicationWillResignActive(_ notification: Notification) {
		hideWindows()
	}
	
	func windowWillClose() {
		NSApp.hide(nil)
	}
	
	func hideWindows() {
		for window in NSApp.windows {
			if window.isKind(of: NSPanel.self) && window.isVisible {
				window.orderOut(nil)
			}
		}
	}
	
	@objc func hideApp() {
		var visibleWindows:Int = 0
		for window in NSApp.windows {
			if window.isKind(of: NSPanel.self) && window.isVisible {
				visibleWindows += 1
			}
		}
		if visibleWindows == 0 {
			NSApp.hide(nil)
		}
	}
}

