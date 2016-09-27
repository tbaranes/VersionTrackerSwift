//
//  AppDelegate.swift
//  VersionTracker Demo OSX
//
//  Created by Tom Baranes on 18/02/16.
//  Copyright © 2016 Tom Baranes. All rights reserved.
//

import Cocoa
import VersionTracker

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var window: NSWindow!

    func applicationDidFinishLaunching(aNotification: NSNotification) {
        VersionTracker.track()
    }

}

