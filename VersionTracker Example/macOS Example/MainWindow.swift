//
//  MainWindow.swift
//  VersionTracking Demo
//
//  Created by Tom Baranes on 18/02/16.
//  Copyright © 2016 Tom Baranes. All rights reserved.
//

import Cocoa

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
        // Do any additional setup after loading the view, typically from a nib.
        labelVersion.stringValue = "Current version: " + VersionTracking.currentVersion()
        labelBuild.stringValue = "Current build: " + VersionTracking.currentBuild()
        labelVersionHistory.stringValue = "Version history: " + VersionTracking.versionHistory().description
        labelBuildHistory.stringValue = "Build history: " + VersionTracking.buildHistory().description
        
        if let previousVersion = VersionTracking.previousVersion() {
            labelPreviousVersion.stringValue = "Previous version: " + previousVersion
        } else {
            labelPreviousVersion.stringValue = "Previous version: first version"
        }
        
        if let previousBuild = VersionTracking.previousBuild() {
            labelPreviousBuild.stringValue = "Previous build: " + previousBuild
        } else {
            labelPreviousBuild.stringValue = "Previous build: first build"
        }
    }

}
