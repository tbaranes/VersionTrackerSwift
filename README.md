# VersionTrackerSwift

[![Travis](https://img.shields.io/travis/tbaranes/VersionTrackerSwift.svg)](https://travis-ci.org/tbaranes/VersionTrackerSwift)
![Language](https://img.shields.io/badge/language-Swift%202.2-orange.svg)
[![CocoaPods](https://img.shields.io/cocoapods/v/VersionTrackerSwift.svg?style=flat)](https://github.com/tbaranes/VersionTrackerSwift)
[![Platform](https://img.shields.io/cocoapods/p/VersionTrackerSwift.svg?style=flat)](http://cocoadocs.org/docsets/VersionTrackerSwift)
[![License](https://img.shields.io/cocoapods/l/VersionTrackerSwift.svg?style=flat)](http://cocoapods.org/pods/VersionTrackerSwift)

VersionTrackerSwift is a versions / builds tracker to know which version has been installed by a user. 

![](./assets/demo.png)

## Usage

In your ApplicationDelegate, call the method `track` to track the current version:

```swift
	// iOS / tvOS
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        VersionTracker.track()
        return true
    }
```

```swift
	// OS X
    func applicationDidFinishLaunching(aNotification: NSNotification) {
        VersionTracker.track()
        return true        
    }

```

Then, call whenever one of the following methods to get the data you need:

```swift
static func isFirstLaunchEver() -> Bool
public static func isFirstLaunch(forVersion version: String = "", firstLaunch: FirstLaunch? = nil) -> Bool
static func isFirstLaunch(forBuild build: String = "", firstLaunch: FirstLaunch? = nil) -> Bool
static func currentVersion() -> String
static func currentBuild() -> String
static func previousVersion() -> String?
static func previousBuild() -> String?
static func versionHistory() -> [String]
static func buildHistory() -> [String]
```

Check out the examples and play with the version / build / number to have a concrete example.

### How it works?

Each time you call the method `track`, the version and build are stored in `NSUserDefaults` if a new version / build is detected. Then, you can access to any information from the tracker.

The version and build number are the information you specify in your app's Info.plist.
 
## Installation

### Cocoapods Installation

VersionTrackerSwift is available on CocoaPods. Add the following line in your Podfile:

```
pod 'VersionTrackerSwift'
```

### Swift Package Manager

VersionTrackerSwift is available on SPM. Just add the following to your Package file:

```swift
import PackageDescription

let package = Package(
    dependencies: [
        .Package(url: "https://github.com/tbaranes/VersionTrackerSwift.git", majorVersion: 1)
    ]
)
```

### Manual Installation

Just drag the `Source/*.swift` files into your project.
 

## What's next

- [ ] Unit tests
- Your ideas!

## Contribution

- If you found a **bug**, open an **issue**
- If you have a **feature request**, open an **issue**
- If you want to **contribute**, submit a **pull request**

## Licence

VersionTrackerSwift is available under the MIT license. See the LICENSE file for more info.

