//
//  InfoView.swift
//  ShARe
//
//  Created by Fernando Borrell on 7/4/22.
//

import SwiftUI

struct InfoView: View {
    var body: some View {
        //Main List
        List {
            //Frameworks Section
            Section("Frameworks") {
                Link("SwiftUI", destination: URL(string: "https://developer.apple.com/documentation/swiftui/")!)
                Link("UIKit", destination: URL(string: "https://developer.apple.com/documentation/uikit/")!)
                Link("ARKit", destination: URL(string: "https://developer.apple.com/documentation/arkit/")!)
                Link("RealityKit", destination: URL(string: "https://developer.apple.com/documentation/realitykit")!)
                Link("Multipeer Connectivity", destination: URL(string: "https://developer.apple.com/documentation/multipeerconnectivity")!)
            }
            .listRowBackground(Color.darkEnd)
            
            //License Section
            Section("License") {
                NavigationLink("License", destination: LicenseView())
            }
            .listRowBackground(Color.darkEnd)
            
            //Dependencies Section
            Section("Dependencies + References") {
                Link("Neumorphic Styles", destination: URL(string: "https://www.hackingwithswift.com/articles/213/how-to-build-neumorphic-designs-with-swiftui")!)
                Link("Apple ARKit Sample Projects", destination: URL(string: "https://developer.apple.com/documentation/arkit/")!)
                Link("Focus Entity by Maxx Frazer", destination: URL(string: "https://github.com/maxxfrazer/FocusEntity")!)
                Link("Reality School Tutorials", destination: URL(string: "https://www.youtube.com/c/realityschool/videos")!)
            }
            .listRowBackground(Color.darkEnd)
        }
        .navigationTitle("Application Info.")
    }
}

struct LicenseView: View {
    let mitLicense = """
    Copyright © 2022 Fernando Borrell

    Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

    The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

    """
    var body: some View {
        Text(mitLicense)
            .font(.custom("Avenir Next", fixedSize: 14).weight(.light))
            .padding(20)
            .navigationTitle("MIT License")
        Spacer()
    }
}
