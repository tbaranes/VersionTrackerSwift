# Changelog

All notable changes to the project will be documented in this file.

---

## Next

#### API breaking changes

N/A

#### Enhancements

- Expose `VersionTracker.currentVersion` and `VersionTracker.currentBuild`. They were previously inaccessible due to
being internal.

#### Bugfixes

N/A

## [3.0.0](https://github.com/tbaranes/VersionTrackerSwift/releases/tag/3.0.0) (27-03-209)

#### API breaking changes

- Xcode 10 and Swift 4.2 support
- Xcode 10.2 and Swift 5 support

## [2.0.0](https://github.com/tbaranes/VersionTrackerSwift/releases/tag/2.0.0) (15-09-2017)

#### API breaking changes

- Swift 4 and Xcode 9 support
- Updating module name: `VersionTrackerSwift` -> `VersionTracker`
- API cleanup, a few methods have been removed, and modified. Please check out the README to update your app

#### Enhancements

- Officially supporting Carthage

#### Bugfixes

- `isFirstLanch` for versions and builds are now working as expected

## [1.1.0](https://github.com/tbaranes/VersionTrackerSwift/releases/tag/1.1.0) (11-09-2016)

#### API breaking changes

- Module name `VersionTracking` has been renamed `VersionTrackerSwift`
- `VersionTracking` has been renamed `VersionTracker`
- Swift 3 support
- Some APIs have been updated to be more swifty, check out the README for more information

#### Enhancements

- `watchOS` support

## [1.0.0](https://github.com/tbaranes/VersionTrackerSwift/releases/tag/1.0) (18-02-2016)

First version
