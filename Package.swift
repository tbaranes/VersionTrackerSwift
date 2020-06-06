// swift-tools-version:5.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "VersionTracker",
    platforms: [
        .iOS(.v8), .macOS(.v10_10), .watchOS(.v2), .tvOS(.v9)
    ],
    products: [
        .library(name: "VersionTracker", targets: ["VersionTracker"])
    ],
    targets: [
        .target(name: "VersionTracker", path: "Sources"),
    ]
)
