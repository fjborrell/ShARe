//
//  NeumorphismView.swift
//  ShARe
//
//  Created by Fernando Borrell on 7/1/22.
//

import SwiftUI

// Light-Mode Neumorphic Text Card View
struct LightNeumorphicRectCard: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 25)
            .fill(Color.offWhite)
            .frame(width: 300, height: 350)
            .shadow(color: Color.black.opacity(0.2), radius: 10, x: 10, y: 10)
            .shadow(color: Color.white.opacity(0.7), radius: 10, x: -5, y: -5)
    }
}

// Dark-Mode Neumorphic Text Card View
struct DarkNeumorphicRectCard: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 25)
            //.fill(LinearGradient(Color.darkStart, Color.darkEnd))
            .fill(Color.darkEnd)
            .frame(width: 300, height: 350)
            .shadow(color: Color.darkStart, radius: 10, x: -10, y: -10)
            .shadow(color: Color.darkEnd, radius: 10, x: 10, y: 10)
    }
}

// Light-Mode Neumorphic Button View
struct NeumorphicButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .padding(30)
            .contentShape(Circle())
            .background(
                Group {
                    if configuration.isPressed {
                        Circle()
                            .fill(Color.offWhite)
                            .overlay(
                                Circle()
                                    .stroke(Color.gray, lineWidth: 4)
                                    .blur(radius: 4)
                                    .offset(x: 2, y: 2)
                                    .mask(Circle().fill(LinearGradient(Color.black, Color.clear)))
                            )
                            .overlay(
                                Circle()
                                    .stroke(Color.white, lineWidth: 8)
                                    .blur(radius: 4)
                                    .offset(x: -2, y: -2)
                                    .mask(Circle().fill(LinearGradient(Color.clear, Color.black)))
                            )
                    } else {
                        Circle()
                            .fill(Color.offWhite)
                            .shadow(color: Color.black.opacity(0.2), radius: 10, x: 10, y: 10)
                            .shadow(color: Color.white.opacity(0.7), radius: 10, x: -5, y: -5)
                    }
                }
            )
    }
}

// Structure used to generate dark mode buttons and toggles
struct DarkBackground<S: Shape>: View {
    var isHighlighted: Bool
    var shape: S

    var body: some View {
        ZStack {
            if isHighlighted {
                shape
                    .fill(Color.darkEnd)
                    .shadow(color: Color.darkStart, radius: 10, x: 5, y: 5)
                    .shadow(color: Color.darkEnd, radius: 10, x: -5, y: -5)

            } else {
                shape
                    .fill(Color.darkEnd)
                    .shadow(color: Color.darkStart, radius: 10, x: -10, y: -10)
                    .shadow(color: Color.darkEnd, radius: 10, x: 10, y: 10)
            }
        }
    }
}

// Dark-Mode Neumorphic Button View
struct DarkButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .padding(30)
            .contentShape(Circle())
            .background(
                DarkBackground(isHighlighted: configuration.isPressed, shape: Circle())
            )
    }
}

