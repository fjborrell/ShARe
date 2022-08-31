//
//  HomeView.swift
//  ShARe
//
//  Created by Fernando Borrell on 7/1/22.
//

import SwiftUI

struct HomeView: View {
    @State var isDarkMode: Bool = false
    
    //Main Home Screen Card's Text
    let bodyText = """
    ShARe is a collaborative AR experience where you can seamlessly view and work on AR scenes with nearby peers!

    \n\n\nPress the button below to start a scene!
    """
    
    var body: some View {
        NavigationView {
            ZStack {
                //Background Color
                if isDarkMode{
                    LinearGradient(.darkStart, .darkEnd)
                        .ignoresSafeArea(edges: .all)
                } else {
                    Color.offWhite
                        .ignoresSafeArea(edges: .all)
                }
                
                VStack {
                    //Title + Logo
                    LogoView(isDarkMode: self.$isDarkMode)
                        .padding()
                    
                    //Main Text Card
                    TextCardView(isDarkMode: self.$isDarkMode, mainText: bodyText)
                        .padding()
                    
                    //ARContentView Button Link
                    ARButtonView(isDarkMode: self.$isDarkMode)
                        .padding()
                    
                    Spacer()
                }
            }
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    DarkModeToggleView(isDarkMode: self.$isDarkMode)
                    
                    //Application Information Button
                    ToolbarView(isDarkMode: self.$isDarkMode)
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
