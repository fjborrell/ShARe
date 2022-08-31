//
//  ARButtonView.swift
//  ShARe
//
//  Created by Fernando Borrell on 7/28/22.
//

import SwiftUI

struct ARButtonView: View {
    @Binding var isDarkMode: Bool
    
    var body: some View {
        if isDarkMode {
            NavigationLink(destination: ARContentView()) {
                Image(systemName: "arkit")
                    .resizable()
                    .frame(width: 30, height: 32)
                    .foregroundColor(.white)
            }
            .buttonStyle(DarkButtonStyle())
        } else {
            NavigationLink(destination: ARContentView()) {
                Image(systemName: "arkit")
                    .resizable()
                    .frame(width: 30, height: 32)
                    .foregroundColor(.black)
            }
            .buttonStyle(NeumorphicButtonStyle())
        }
        
    }
}
