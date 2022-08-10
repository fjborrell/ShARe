//
//  Model.swift
//  ShARe
//
//  USDZ Models used in this app are available @ https://developer.apple.com/augmented-reality/quick-look/
//
//  Created by Fernando Borrell on 7/18/22.
//

import UIKit
import RealityKit
import Combine

class Model {
    var modelName: String
    var image: UIImage
    var modelEntity: ModelEntity?
    
    private var cancellable: AnyCancellable? = nil
    
    init(modelName: String) {
        self.modelName = modelName
        self.image = UIImage(named: modelName)!
        
        let filename = modelName + ".usdz"
        self.cancellable = ModelEntity.loadModelAsync(named: filename)
            .sink(receiveCompletion: { loadCompletion in
                //Handle error
                print("ASYNC: Unable to load modelEntity for modelName - \(self.modelName)")
            }, receiveValue: { modelEntity in
                //Get the modelEntity
                self.modelEntity = modelEntity
                print("ASYNC: Successfully loaded modelEntity for modelName - \(self.modelName)")
            })
    }
}
