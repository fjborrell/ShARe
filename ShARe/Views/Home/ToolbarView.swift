//
//  ToolbarView.swift
//  ShARe
//
//  Created by Fernando Borrell on 7/28/22.
//

import SwiftUI

//INFO BUTTON
struct ToolbarView: View {
    @Binding var isDarkMode: Bool
    private var foregroundMode: Color {
        switch isDarkMode {
        case true:
            return Color.purple
        case false:
            return Color.orange
        }
    }
    
    var body: some View {
        NavigationLink(destination: InfoView()) {
            Image(systemName: "info.circle.fill")
                .resizable()
                .frame(width: 30, height: 30)
                .foregroundColor(foregroundMode)
                .padding()
        }
    }
}

//MAIN TITLE + LOGO LABEL
struct LogoView: View {
    @Binding var isDarkMode: Bool
    private var gradientMode: [Color] {
        switch isDarkMode {
        case true:
            return [Color.purple, Color.indigo]
        case false:
            return [Color.orange, Color.red]
        }
    }
    var body: some View {
        Label("ShARe", systemImage: "wave.3.forward.circle.fill")
            .labelStyle(.trailingIcon)
            .font(.custom("Avenir Next", fixedSize: 36).weight(.bold))
            .foregroundGradient(colors: gradientMode)
            .padding()
    }
}

//TOGGLE SWITCH FOR LIGHT AND DARK MODE
struct DarkModeToggleView: View {
    @Binding var isDarkMode: Bool
    var body: some View {
        Toggle(isOn: self.$isDarkMode.animation(.easeInOut), label: {
            if isDarkMode {
                Label("Dark", systemImage: "moon.stars.fill")
                    .foregroundColor(.white)
            } else {
                Label("Light", systemImage: "sun.and.horizon.fill")
                    .foregroundColor(.black)
            }
            
        })
        .padding()
        .toggleStyle(SwitchToggleStyle(tint: .purple))
    }
}
