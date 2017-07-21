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

fileprivate enum DefaultsKeys: String {
    case history = "kVTVersionHistory"
    case versions = "kVTVersions"
    case builds = "kVTBuilds"
}

public struct VersionTracker {

    // MARK: Private properties

    fileprivate var allVersions: [String: [String]]
    public let isFirstLaunchEver: Bool
    public let isFirstVersionLaunch: Bool
    public let isFirstBuildLaunch: Bool

    // MARK: Singleton

    public static var shared = VersionTracker()

    private init() {
        let previousVersions = UserDefaults.standard.dictionary(forKey: DefaultsKeys.history.rawValue) as? [String: [String]]
        allVersions = previousVersions ?? [DefaultsKeys.versions.rawValue: [String](), DefaultsKeys.builds.rawValue: [String]()]
        isFirstLaunchEver = allVersions[DefaultsKeys.versions.rawValue]!.isEmpty

        let version = VersionTracker.currentVersion
        isFirstVersionLaunch = allVersions[DefaultsKeys.versions.rawValue]!.first { $0 == version } == nil

        let build = VersionTracker.currentBuild
        isFirstBuildLaunch = allVersions[DefaultsKeys.builds.rawValue]!.first { $0 == build } == nil
    }

}

// MARK: - Configure

extension VersionTracker {

    public mutating func track() {
        let currentVersion = VersionTracker.currentVersion
        let currentBuild = VersionTracker.currentBuild
        if isFirstVersionLaunch {
            allVersions[DefaultsKeys.versions.rawValue]?.append(currentVersion)
        }
        if isFirstBuildLaunch {
            allVersions[DefaultsKeys.builds.rawValue]?.append(currentBuild)
        }
        UserDefaults.standard.set(allVersions, forKey: DefaultsKeys.history.rawValue)
    }

}

// MARK: - History

extension VersionTracker {

    public var versionHistory: [String] {
        return allVersions[DefaultsKeys.versions.rawValue]!
    }

    public var buildHistory: [String] {
        return allVersions[DefaultsKeys.builds.rawValue]!
    }

}

// MARK: - Current

extension VersionTracker {

    static var currentVersion: String {
        let currentVersion = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString")
        return currentVersion as? String ?? ""
    }

    static var currentBuild: String {
        let currentVersion = Bundle.main.object(forInfoDictionaryKey: kCFBundleVersionKey as String)
        return currentVersion as? String ?? ""
    }

}
