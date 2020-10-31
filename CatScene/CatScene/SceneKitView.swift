//
//  SceneKitView.swift
//  CatScene
//
//  Created by Ginger on 31/10/2020.
//

import SwiftUI
import SceneKit

struct SceneKitView: UIViewRepresentable {
    let scene = SCNScene(named: "cat.scn")!
    
    func makeUIView(context: Context) -> SCNView {
        // create and add a camera to the scene
        let cameraNode = SCNNode()
        cameraNode.camera = SCNCamera()
        scene.rootNode.addChildNode(cameraNode)
        
        // place the camera
        cameraNode.position = SCNVector3(x: 0, y: 0, z: 15)
        
        // create and add a light to the scene
        let lightNode = SCNNode()
        lightNode.light = SCNLight()
        lightNode.light!.type = .omni
        lightNode.light!.color = UIColor(red: 0.6, green: 0.6, blue: 0.6, alpha: 1.0)
        lightNode.position = SCNVector3(x: 0, y: 50, z: 50)
        scene.rootNode.addChildNode(lightNode)
        
        // create and add an ambient light to the scene
        let ambientLight = SCNNode()
        ambientLight.light = SCNLight()
        ambientLight.light!.type = .ambient
        ambientLight.light!.color = UIColor.darkGray
        scene.rootNode.addChildNode(ambientLight)
        
        // retrieve the SCNView
        let scnView = SCNView()
        return scnView
    }
    
    func updateUIView(_ scnView: SCNView, context: Context) {
        scnView.scene = scene
        
        // allows the user to manipulate the camera
        scnView.allowsCameraControl = true
        
        // show statistics such as fps and timing information
        scnView.showsStatistics = true
        
        // configure the view
        scnView.backgroundColor = .white
    }
}

struct SceneKitView_Previews: PreviewProvider {
    static var previews: some View {
        SceneKitView()
    }
}
