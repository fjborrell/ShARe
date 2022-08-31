# ShARe
<img src="/docs/images/icon.png" alt="Icon" title="AppIcon" width="200" height="200" />

## Vision, Description, and Features

ShARe is a collaborative and proximity-based AR application. It began as a higher vision for producing large scale AR scenes that can be triggered by proximity to specific users or locations. This could be used to create AR proximity zones at public locations such as museums, retail stores, parks, etc. Users that enter the range would be able to auto-join the scene.

**Prototype & Key Features:**

This MVP/prototype was developed in ~25 days, and leverages Apple’s Multi-Peer Connectivity Framework. The connection works by broadcasting a session ID which will search for, and connect if found, with devices broadcasting/searching for the same ID. This works via available local connection methods: LAN, Bluetooth, or Wi-Fi. The devices then communicate and replicate any changes made to the AR scene by any user.

* Horizontal scrollable model selector (5 models available)
* [Focus Square](https://github.com/maxxfrazer/FocusEntity) + AR Coaching Overlay for assisted tracking
* Scene understanding (LiDAR Supported iPhones only) and feature points are displayed 
* Selected model can be tapped onto the scene, and then moved, rotated, and scaled with standard screen gestures
* Users will auto-join users within range. Users in the frame of another will be detected and tracked with a generated sphere & XYZ guides


## Getting Started

### Requirements

* **Dependency**: [Focus Entity by Maxx Frazer](https://github.com/maxxfrazer/FocusEntity).
* Optimal: iPhone 12 or newer, running iOS 15.5+. 
* Minimum: iPhone 6s or newer, running iOS 13.0+.
* Xcode 13

### Installation and Usage

* Download the whole project. Open on Xcode.
* Currently, project is set to compile successfully when testing on a physical iOS device. Comment out respective code in `Views/AR/ARContentView` if simulating.
```
//If simulating on Xcode for view testing
let anchorEntity = AnchorEntity()
//If building on physical iOS Device
let anchorEntity = AnchorEntity(anchor: participantAnchor)
```
* **NOTE**: The sessionID is currently hardcoded to `"share-collab"`. If updated, **update the bonjour services/protocol names to match!**
```
// ./ShARe/Views/AR/MultipeerSession.swift
static let serviceType = "share-collab"
```
* Compile project
* Follow on-screen instructions for Xcode specific procedures (trusting device, signing, etc.)

## Showcase
### Multipeer Connectivity Demo
iPhone 12 (Left) & iPhone 13 Pro Max w/ LiDAR Support (Right)

<img src="/docs/gifs/multipeer_demo.gif" alt="MultipeerDemo" title="MultipeerDemo" width="600" height="550" /> 

### Miscellaneous and Privacy
1. Dark Mode & Application Info
2. LAN Access Request
3. Camera Access Request
<p float="left">
  <img src="/docs/gifs/dark_mode_demo.gif" alt="DarkMode" title="DarkMode" width="240" height="500" />
  &nbsp;&nbsp;&nbsp;&nbsp;
  <img src="/docs/images/LAN_access.jpeg" alt="LAN" title="LANAccess" width="240" height="500" /> 
  &nbsp;&nbsp;&nbsp;&nbsp;
  <img src="/docs/images/camera_access.jpeg" alt="Camera" title="CameraAccess" width="240" height="500" /> 
</p>


## License
This project is licensed under the MIT License - see the LICENSE.txt file for details

## Frameworks
* [SwiftUI](https://developer.apple.com/documentation/swiftui/)
* [UIKit](https://developer.apple.com/documentation/uikit/)
* [ARKit](https://developer.apple.com/documentation/arkit/)
* [RealityKit](https://developer.apple.com/documentation/realitykit/)
* [Multipeer Connectivity](https://developer.apple.com/documentation/multipeerconnectivity)

## Acknowledgements
Inspiration, tutorials, samples, references, etc.
* [Neumorphic Styles](https://www.hackingwithswift.com/articles/213/how-to-build-neumorphic-designs-with-swiftui)
* [Apple ARKit Samples](https://developer.apple.com/documentation/arkit/)
* [Reality School Tutorials](https://www.youtube.com/c/realityschool/videos)

## Known Limitations & Issues:
* User A has model X selected. User B has model Y selected. If User A places model X into the collaborative scene, although it will be in the right position, User B will see model Y.
* Any updates to models’ spatial information (scale, rotation, position) will stay local to that phone
  * -> Both 1 & 2 fixable by communicating model information through multipeer session!
* If connected to a very crowded or secure network, connection to other phones will be unstable
* When all users leave the session, the scene is lost. At least one user must be present to preserve data.
  * -> Fix by saving to cloud? Maintain most recent session in storage? Several fixes possible...
