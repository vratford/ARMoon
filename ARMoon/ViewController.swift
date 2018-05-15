//
//  ViewController.swift
//  ARMoon
//
//  Created by Vincent Ratford on 5/15/18.
//  Copyright © 2018 Vincent Ratford. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {
    
        var diceArray = [SCNNode]()         // initialize to empty array

    @IBOutlet var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //        self.sceneView.debugOptions = [ARSCNDebugOptions.showFeaturePoints]  // debug option to display feature points
        
        
        // Set the view's delegate
        sceneView.delegate = self
        
        
        displayMoon()
        
        

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()
        
        guard ARWorldTrackingConfiguration.isSupported else {
            fatalError("AR only available on Iphone 7 or greater")
        }
        
        

        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    // MARK: - ARSCNViewDelegate
    
    func displayMoon() {
        
        let sphere = SCNSphere(radius: 0.2)
        
        let material = SCNMaterial() // material is color red
        
        material.diffuse.contents = UIImage(named: "art.scnassets/moon.jpg")
        
        sphere.materials = [material] // passing to array
        
        let node = SCNNode() // point in 3d space
        
        node.position = SCNVector3(x: 0, y: 0, z: -0.5) // position of point
        
        node.geometry = sphere // node has geometry of sphere
        
        sceneView.scene.rootNode.addChildNode(node)  // place in sceneview
        
        sceneView.autoenablesDefaultLighting = true // adds light and shadows to sphere
        
    }
    

}
