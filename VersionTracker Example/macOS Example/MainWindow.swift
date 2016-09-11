//
//  MainWindow.swift
//  VersionTracker Demo
//
//  Created by Tom Baranes on 18/02/16.
//  Copyright © 2016 Tom Baranes. All rights reserved.
//

import Cocoa
import VersionTrackerSwift

class MainWindow: NSWindow {

    // MARK: - Properties
    
    @IBOutlet weak var labelVersion: NSTextField!
    @IBOutlet weak var labelBuild: NSTextField!
    @IBOutlet weak var labelPreviousVersion: NSTextField!
    @IBOutlet weak var labelPreviousBuild: NSTextField!
    @IBOutlet weak var labelVersionHistory: NSTextField!
    @IBOutlet weak var labelBuildHistory: NSTextField!
    
    // MARK: - Life cycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        labelVersion.stringValue = "Current version: " + VersionTracker.currentVersion()
        labelBuild.stringValue = "Current build: " + VersionTracker.currentBuild()
        labelVersionHistory.stringValue = "Version history: " + VersionTracker.versionHistory().description
        labelBuildHistory.stringValue = "Build history: " + VersionTracker.buildHistory().description
        
        if let previousVersion = VersionTracker.previousVersion() {
            labelPreviousVersion.stringValue = "Previous version: " + previousVersion
        } else {
            labelPreviousVersion.stringValue = "Previous version: first version"
        }
        
        if let previousBuild = VersionTracker.previousBuild() {
            labelPreviousBuild.stringValue = "Previous build: " + previousBuild
        } else {
            labelPreviousBuild.stringValue = "Previous build: first build"
        }    
    }

}
