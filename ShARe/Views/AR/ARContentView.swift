//
//  ARContentView.swift
//  ShARe
//
//  This includes custom implementations of logic found in Apple's publicly available 'CollaborativeSession'
//  sample built with SwiftUI in mind. Please view the original sample for further documentation and explanations
//
//  Created by Fernando Borrell on 7/2/22.

import SwiftUI
import RealityKit
import ARKit
import FocusEntity

struct ARContentView : View {
    @StateObject var customARView = CustomARView()
    @State private var selectedModel: Model?
    
    //Array of Model Objects
    private var models: [Model] {
        
        //Dynamically generate array of model file names
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let assets = try! fm.contentsOfDirectory(atPath: path)

        var availableModels: [Model] = []

        for file in assets where file.hasSuffix("usdz") {
            let modelName = file.replacingOccurrences(of: ".usdz", with: "")
            let model = Model(modelName: modelName)
            availableModels.append(model)
        }

        return availableModels
    }
    
    var body: some View {
        ZStack(alignment: .bottom) {
            //AR View
            ARViewContainer(selectedModel: self.$selectedModel)
                .environmentObject(customARView)
                .ignoresSafeArea(edges: .all)
            
            //Model Selector + Guiding Text
            VStack {
                Text("Select a model and tap to place it in the scene.")
                    .foregroundColor(.yellow)
                ModelSelectorView(selectedModel: $selectedModel, models: self.models)
            }
        }
    }
}


struct ARViewContainer: UIViewRepresentable {
    @EnvironmentObject var customARView: CustomARView
    @Binding var selectedModel: Model?
    
    func makeUIView(context: Context) -> ARView {
        //Communicate with the UIKit coordinator
        customARView.arView.session.delegate = context.coordinator
        return customARView.arView
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {
    }
}

extension ARViewContainer {
    //UIKit's UIView updates are communicated to SwiftUI; update coordinator properties
    
    class Coordinator: NSObject, ARSessionDelegate {
        var parent: ARViewContainer
        
        init(_ parent: ARViewContainer) {
            self.parent = parent
        }
        
        func session(_ session: ARSession, didAdd anchors: [ARAnchor]) {
            for anchor in anchors {
                //If connected to a peer, generate a participant anchor for their tracking sphere and XYZ guides
                if let participantAnchor = anchor as? ARParticipantAnchor{
                    print("Established joint experience with a peer.")
                    
                    //If simulating on Xcode for view testing
                    //let anchorEntity = AnchorEntity()
                    //If building on physical iOS Device
                    let anchorEntity = AnchorEntity(anchor: participantAnchor)
                    
                    
                    let coordinateSystem = MeshResource.generateCoordinateSystemAxes()
                    anchorEntity.addChild(coordinateSystem)
                    
                    let color = participantAnchor.sessionIdentifier?.toRandomColor() ?? .white
                    let coloredSphere = ModelEntity(mesh: MeshResource.generateSphere(radius: 0.03),
                                                    materials: [SimpleMaterial(color: color, isMetallic: false)])
                    anchorEntity.addChild(coloredSphere)
                    
                    self.parent.customARView.arView.scene.addAnchor(anchorEntity)
                } else {
                    //Add the selected model to both user's scenes. Default is toy robot.
                    if let anchorName = anchor.name, anchorName == "default"{
                        self.parent.customARView.arView.placeEntityOnScene(named: self.parent.selectedModel?.modelName ?? "toy_robot_vintage", for: anchor)
                    }
                }
            }
        }
        
        func session(_ session: ARSession, didOutputCollaborationData data: ARSession.CollaborationData) {
            guard let multipeerSession = self.parent.customARView.multipeerSession else { return }
            if !multipeerSession.connectedPeers.isEmpty {
                guard let encodedData = try? NSKeyedArchiver.archivedData(withRootObject: data, requiringSecureCoding: true)
                else { fatalError("Unexpectedly failed to encode collaboration data.") }
                // Use reliable mode if the data is critical, and unreliable mode if the data is optional.
                let dataIsCritical = data.priority == .critical
                multipeerSession.sendToAllPeers(encodedData, reliably: dataIsCritical)
            } else {
                print("Deferred sending collaboration to later because there are no peers.")
            }
        }
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(self)
    }
}

//Extends ARView to enable touch gestures
extension ARView {
    func enableTapGesture() {
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTap(recognizer:)))
        self.addGestureRecognizer(tapGestureRecognizer)
    }
    
    @objc func handleTap(recognizer: UITapGestureRecognizer) {
        let locationTapped = recognizer.location(in: self)
                            
        //Attempt to find a 3D location on a horizontal surface underneath the user's touch location.
        let availableLocationsOnTap = self.raycast(from: locationTapped, allowing: .estimatedPlane, alignment: .any)
        
        //Confirm the first available location on the tap as the 3D location of the new anchor
        if let confirmedTapLocation = availableLocationsOnTap.first {
            // Add an ARAnchor at the touch location with name that is checked later in `session(_:didAdd:)`.
            let anchor = ARAnchor(name: "default", transform: confirmedTapLocation.worldTransform)
            self.session.add(anchor: anchor)
        } else {
            print("Warning: Object placement failed.")
        }
    }
    
    func placeEntityOnScene(named entityName: String, for anchor: ARAnchor){
        let entity = try! ModelEntity.loadModel(named: entityName)
        
        entity.generateCollisionShapes(recursive: true)
        self.installGestures([.all], for: entity)
        
        //If simulating on Xcode for view testing
        //let anchorEntity = AnchorEntity()
        //If building on physical iOS Device
        let anchorEntity = AnchorEntity(anchor: anchor)
        
        anchorEntity.addChild(entity)
        self.scene.addAnchor(anchorEntity)
    }
}
