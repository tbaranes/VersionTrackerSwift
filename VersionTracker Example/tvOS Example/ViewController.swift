//
//  ViewController.swift
//  VersionTracking Demo tvOS
//
//  Created by Tom Baranes on 18/02/16.
//  Copyright © 2016 Tom Baranes. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - Properties
    
    @IBOutlet weak var labelVersion: UILabel!
    @IBOutlet weak var labelBuild: UILabel!
    @IBOutlet weak var labelPreviousVersion: UILabel!
    @IBOutlet weak var labelPreviousBuild: UILabel!
    @IBOutlet weak var labelVersionHistory: UILabel!
    @IBOutlet weak var labelBuildHistory: UILabel!
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        labelVersion.text = "Current version: " + VersionTracking.currentVersion()
        labelBuild.text = "Current build: " + VersionTracking.currentBuild()
        labelVersionHistory.text = "Version history: " + VersionTracking.versionHistory().description
        labelBuildHistory.text = "Build history: " + VersionTracking.buildHistory().description
        
        if let previousVersion = VersionTracking.previousVersion() {
            labelPreviousVersion.text = "Previous version: " + previousVersion
        } else {
            labelPreviousVersion.text = "Previous version: first version"
        }
        
        if let previousBuild = VersionTracking.previousBuild() {
            labelPreviousBuild.text = "Previous build: " + previousBuild
        } else {
            labelPreviousBuild.text = "Previous build: first build"
        }
    }

}

