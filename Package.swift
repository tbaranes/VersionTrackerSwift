// swift-tools-version:5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "VersionTracker",
    products: [
        .library(name: "VersionTracker", targets: ["VersionTracker"])
    ],
    targets: [
        .target(
            name: "VersionTracker",
            path: "Sources",
            resources: [
                .process("Resources/PrivacyInfo.xcprivacy")
            ]
        ),
    ]
)
