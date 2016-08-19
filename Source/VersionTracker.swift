// VersionTracker.swift
//
// Copyright (c) 2016 Tom Baranes
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

import Foundation

private let kUserDefaultsVersionHistory = "kVTVersionHistory"
private let kVersionsKey = "kVTVersions"
private let kBuildsKey = "kVTBuilds"

public struct VersionTracker {
    
    public typealias FirstLaunch = () -> Void

    // MARK: Private properties

    fileprivate var versions: [String: [String]]
    fileprivate var firstLaunchEver: Bool = false
    fileprivate var firstLaunchForVersion: Bool = false
    fileprivate var firstLaunchForBuild: Bool = false

    // MARK: Singleton

    static var sharedInstance = VersionTracker()

    private init() {
        if let versionHistory = UserDefaults.standard.dictionary(forKey: kUserDefaultsVersionHistory) as? [String: [String]] {
            versions = versionHistory
        } else {
            versions = [kVersionsKey: [String](), kBuildsKey: [String]()]
            firstLaunchEver = true
        }
    }

    // MARK: - Tracker
    
    public static func track() {
        sharedInstance.startTracking()
    }
    
    public static func isFirstLaunchEver() -> Bool {
        return sharedInstance.firstLaunchEver
    }
    
    public static func isFirstLaunch(forVersion version: String = "", firstLaunch: FirstLaunch? = nil) -> Bool {
        var isFirstVersion = sharedInstance.firstLaunchForVersion
        if version != "" {
            isFirstVersion = sharedInstance.historyContainsVersion(version: version)
        }
        
        if let closure = firstLaunch, isFirstVersion == true{
            closure()
        }
        return isFirstVersion
    }
    
    public static func isFirstLaunch(forBuild build: String = "", firstLaunch: FirstLaunch? = nil) -> Bool {
        var isFirstBuild = sharedInstance.firstLaunchForBuild
        if build != "" {
            isFirstBuild = sharedInstance.historyContainsBuild(build: build)
        }
        
        if let closure = firstLaunch, isFirstBuild == true {
            closure()
        }
        return isFirstBuild
    }
    
    // MARK: - Version
    
    public static func currentVersion() -> String {
        let currentVersion = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString")
        if let version = currentVersion as? String {
            return version
        }
        return ""
    }

    public static func previousVersion() -> String? {
        return sharedInstance.previousVersion()
    }
    
    public static func versionHistory() -> [String] {
        guard let versionHistory = sharedInstance.versions[kVersionsKey] else {
            return []
        }
        return versionHistory
    }
    
    // MARK: - Build
    
    public static func currentBuild() -> String {
        let currentVersion = Bundle.main.object(forInfoDictionaryKey: kCFBundleVersionKey as String)
        if let version = currentVersion as? String {
            return version
        }
        return ""
    }
    
    public static func previousBuild() -> String? {
        return sharedInstance.previousBuild()
    }
    
    public static func buildHistory() -> [String] {
        guard let buildHistory = sharedInstance.versions[kBuildsKey] else {
            return []
        }
        return buildHistory
    }

}

fileprivate extension VersionTracker {
    
    // MARK: - Initializer
    
    mutating func startTracking() {
        updateFirstLaunchForVersion()
        updateFirstLaunchForBuild()
        if firstLaunchForVersion || firstLaunchForBuild {
            UserDefaults.standard.set(versions, forKey: kUserDefaultsVersionHistory)
            UserDefaults.standard.synchronize()
        }
    }
    
    mutating func updateFirstLaunchForVersion() {
        let currentVersion = VersionTracker.currentVersion()
        if versions[kVersionsKey]?.contains(currentVersion) == false {
            versions[kVersionsKey]?.append(currentVersion)
            firstLaunchForVersion = true
        }
    }
    
    mutating func updateFirstLaunchForBuild() {
        let currentBuild = VersionTracker.currentBuild()
        if versions[kBuildsKey]?.contains(currentBuild) == false {
            versions[kBuildsKey]?.append(currentBuild)
            firstLaunchForBuild = true
        }
    }
    
    // MARK: - Helper
    
    func historyContainsVersion(version: String) -> Bool {
        guard let versionsHistory = versions[kVersionsKey] else {
            return false
        }
        return versionsHistory.contains(version)
    }
    
    func historyContainsBuild(build: String) -> Bool {
        guard let buildHistory = versions[kBuildsKey] else {
            return false
        }
        return buildHistory.contains(build)
    }
    
    func previousBuild() -> String? {
        guard let versionsHistory = versions[kVersionsKey], versionsHistory.count >= 2 else {
            return nil
        }
        return versionsHistory[versionsHistory.count - 2]
    }
    
    func previousVersion() -> String? {
        guard let buildsHistory = versions[kBuildsKey], buildsHistory.count >= 2 else {
            return nil
        }
        return buildsHistory[buildsHistory.count - 2]
    }
    
}

