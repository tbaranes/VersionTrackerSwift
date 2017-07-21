//
//  ViewController.swift
//  VersionTracker Demo tvOS
//
//  Created by Tom Baranes on 18/02/16.
//  Copyright © 2016 Tom Baranes. All rights reserved.
//

import UIKit
import VersionTracker

class ViewController: UIViewController {

    // MARK: - Properties

    @IBOutlet weak var labelIsFirstLaunchEver: UILabel!
    @IBOutlet weak var labelIsFirstVersionLaunch: UILabel!
    @IBOutlet weak var labelIsFirstBuildLaunch: UILabel!
    @IBOutlet weak var labelVersionHistory: UILabel!
    @IBOutlet weak var labelBuildHistory: UILabel!

    // MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        VersionTracker.shared.track()

        labelVersionHistory.text = "Versions history: " + VersionTracker.shared.versionHistory.description
        labelBuildHistory.text = "Builds history: " + VersionTracker.shared.buildHistory.description
        labelIsFirstLaunchEver.text = "Is first launch ever: \(VersionTracker.shared.isFirstLaunchEver)"
        labelIsFirstVersionLaunch.text = "Is first version launch: \(VersionTracker.shared.isFirstVersionLaunch)"
        labelIsFirstBuildLaunch.text = "Is first build launch: \(VersionTracker.shared.isFirstBuildLaunch)"
    }
    
}
