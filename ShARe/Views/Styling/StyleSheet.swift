//
//  StyleSheet.swift
//  ShARe
//
//  Created by Fernando Borrell on 7/1/22.
//

import SwiftUI

// Labelstyle to swap the default position of image and text
struct TrailingIconLabelStyle: LabelStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack{
            configuration.title
            configuration.icon
                //.scaleEffect(0.7, anchor: .leading)
        }
    }
}

// Allows the label style to be called with dot notation
extension LabelStyle where Self == TrailingIconLabelStyle {
    static var trailingIcon: Self { Self() }
}

// Define Off-White and Gradient shades of black
extension Color {
    static let offWhite = Color(red: 225 / 255, green: 225 / 255, blue: 235 / 255)
    static let darkStart = Color(red: 50 / 255, green: 60 / 255, blue: 65 / 255)
    static let darkEnd = Color(red: 25 / 255, green: 25 / 255, blue: 30 / 255)
}

//Define a new constructor for linear gradients
extension LinearGradient {
    init(_ colors: Color...) {
        self.init(gradient: Gradient(colors: colors), startPoint: .topLeading, endPoint: .bottomTrailing)
    }
}

//Define a new View property to create gradient colors for Views.
extension View {
    public func foregroundGradient(colors: [Color]) -> some View {
        self.overlay(
            LinearGradient(
                colors: colors,
                startPoint: .top,
                endPoint: .bottom)
        )
            .mask(self)
    }
}
