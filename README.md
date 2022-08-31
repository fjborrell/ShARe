# ShARe
<img src="/docs/images/icon.png" alt="Icon" title="AppIcon" width="200" height="200" /> 

Simple overview of use/purpose.

## Description

An in-depth paragraph about your project and overview of use.

## Getting Started

### Requirements

* **Dependency**: [Focus Entity by Maxx Frazer](https://github.com/maxxfrazer/FocusEntity).
* Optimal: iPhone 12 or newer, running iOS 15.5+. 
* Minimum: iPhone 6s or newer, running iOS 13.0+.
* Xcode 13

### Installing and Running

* Download the whole project. Open on Xcode.
* Choose whether to simulate on Mac or run on actual iOS Device. Comment out respective code in Views/AR/ARContentView. Default is set to compile on a physical iOS Device.
```
//If simulating on Xcode for view testing
let anchorEntity = AnchorEntity()
//If building on physical iOS Device
let anchorEntity = AnchorEntity(anchor: participantAnchor)
```
* Compile project (connect physical device before this step).
* Follow on-screen instructions for app download procedures (trusting device, signing on Xcode, etc.)

## Showcase
### Multipeer Connectivity Demo
iPhone 12 (Left) & iPhone 13 Pro Max w/ LiDAR Support (Right)

<img src="/docs/gifs/multipeer_demo.gif" alt="MultipeerDemo" title="MultipeerDemo" width="600" height="550" /> 

### Miscellaneous
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
Inspiration, tutorials, samples, dependencies, etc.
* **Dependency**: [Focus Entity by Maxx Frazer](https://github.com/maxxfrazer/FocusEntity)
* [Neumorphic Styles](https://www.hackingwithswift.com/articles/213/how-to-build-neumorphic-designs-with-swiftui)
* [Apple ARKit Samples](https://developer.apple.com/documentation/arkit/)
* [Reality School Tutorials](https://www.youtube.com/c/realityschool/videos)
