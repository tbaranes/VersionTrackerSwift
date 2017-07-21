//
//  MainWindow.swift
//  VersionTracker Demo
//
//  Created by Tom Baranes on 18/02/16.
//  Copyright © 2016 Tom Baranes. All rights reserved.
//

import Cocoa
import VersionTracker

class MainWindow: NSWindow {

    // MARK: - Properties

    @IBOutlet weak var labelIsFirstLaunchEver: NSTextField!
    @IBOutlet weak var labelIsFirstVersionLaunch: NSTextField!
    @IBOutlet weak var labelIsFirstBuildLaunch: NSTextField!
    @IBOutlet weak var labelVersionHistory: NSTextField!
    @IBOutlet weak var labelBuildHistory: NSTextField!

    // MARK: - Life cycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        VersionTracker.shared.track()

        labelVersionHistory.stringValue = "Versions history: " + VersionTracker.shared.versionHistory.description
        labelBuildHistory.stringValue = "Builds history: " + VersionTracker.shared.buildHistory.description
        labelIsFirstLaunchEver.stringValue = "Is first launch ever: \(VersionTracker.shared.isFirstLaunchEver)"
        labelIsFirstVersionLaunch.stringValue = "Is first version launch: \(VersionTracker.shared.isFirstVersionLaunch)"
        labelIsFirstBuildLaunch.stringValue = "Is first build launch: \(VersionTracker.shared.isFirstBuildLaunch)"
    }

}
