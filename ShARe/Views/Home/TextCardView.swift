//
//  TextCardView.swift
//  ShARe
//
//  Created by Fernando Borrell on 7/28/22.
//

import SwiftUI

struct TextCardView: View {
    @Binding var isDarkMode: Bool
    var mainText: String
    private var textColor: Color {
        switch isDarkMode {
        case true:
            return Color.white
        case false:
            return Color.black
        }
    }
    var body: some View {
        ZStack {
            if isDarkMode{
                DarkNeumorphicRectCard()
            } else {
                LightNeumorphicRectCard()
            }
            
            VStack {
                Label("Welcome!", systemImage: "hand.wave.fill")
                    .labelStyle(.trailingIcon)
                    .padding()
                    .font(.custom("Avenir Next", fixedSize: 25).weight(.bold))
                    .foregroundColor(textColor)
                Text(mainText)
                    .frame(width: 250, height: 250, alignment: Alignment.top)
                    .font(.custom("Avenir Next", fixedSize: 18).weight(.light))
                    .foregroundColor(textColor)
            }
        }
    }
}
