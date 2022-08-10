//
//  ModelSelectorView.swift
//  ShARe
//
//  Created by Fernando Borrell on 7/21/22.
//

import SwiftUI

//UI VIEW FOR THE SCROLLABLE MODEL SELECTION
struct ModelSelectorView: View {
    @Binding var selectedModel: Model?
    var models: [Model]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 30) {
                ForEach(0 ..< self.models.count, id: \.self) { index in
                    Button(action: {
                        print("DEBUG: Selected model with name: \(self.models[index].modelName)")
                        self.selectedModel = self.models[index]
                    }) {
                        if self.selectedModel?.modelName == self.models[index].modelName{
                            ZStack {
                                RoundedRectangle(cornerRadius: 28)
                                    .frame(width: 103, height: 97, alignment: .center)
                                    .foregroundColor(Color.blue)
                                
                                Image(uiImage: self.models[index].image)
                                    .resizable()
                                    .frame(height: 90)
                                    .aspectRatio(1/1, contentMode: .fit)
                                    .background(Color.offWhite)
                                    .cornerRadius(25)
                            }
                        } else {
                            Image(uiImage: self.models[index].image)
                                .resizable()
                                .frame(height: 90)
                                .aspectRatio(1/1, contentMode: .fit)
                                .background(Color.offWhite)
                                .cornerRadius(25)
                        }
                    }
                    .buttonStyle(PlainButtonStyle())
                    
                }
            }
        }
        .padding()
        .background(Color.black.opacity(0.8))
    }
}
