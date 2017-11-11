//
//  GameViewController.swift
//  catapults1
//
//  Created by Patrick Hayes on 11/10/17.
//  Copyright © 2017 Patrick Hayes. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit
import GoogleMaps

class GameViewController: UIViewController {
    
    //--------------------------------
    var value: String?
    @IBOutlet weak var powerValue: UILabel!
    @IBAction func powerValueSlider(_ sender: UISlider) {
        value = "\(sender.value)"
        powerValue.text = value
    }
    @IBAction func powerUpSlider(_ sender: UISlider) {
        
        powerValue.text = "\(pow(10,Int(value!)!))"

    }
    @IBAction func fireButtonPressed(_ sender: UIButton) {
        
    }
    
    
    
    
    
    //--------------------------------
    

    @IBOutlet weak var mappView: GMSMapView!
    
    @IBAction func button(_ sender: Any) {
        print("Tapped")
        let location = GMSCameraPosition.camera(withLatitude: -33.8683, longitude: 151.2086, zoom: 8)
        self.mappView.animate(to: location)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Load 'GameScene.sks' as a GKScene. This provides gameplay related content
        // including entities and graphs.
        if let scene = GKScene(fileNamed: "GameScene") {

            // Get the SKScene from the loaded GKScene
            if let sceneNode = scene.rootNode as! GameScene? {

                // Copy gameplay related content over to the scene
                sceneNode.entities = scene.entities
                sceneNode.graphs = scene.graphs

                // Set the scale mode to scale to fit the window
                sceneNode.scaleMode = .aspectFill

                // Present the scene
                if let view = self.view as! SKView? {
                    view.presentScene(sceneNode)

                    view.ignoresSiblingOrder = true

                    view.showsFPS = true
                    view.showsNodeCount = true
                }
            }
        }
        
//        mapView = GMSMapView.map(withFrame: CGRect(x: 100, y: 100, width: 200, height: 200), camera: GMSCameraPosition.camera(withLatitude: 51.050657, longitude: 10.649514, zoom: 2.5))
//
//        //so the mapView is of width 200, height 200 and its center is same as center of the self.view
//        mapView?.center = self.view.center
//
//        self.view.addSubview(mapView!)
        
        
        //creating map
        let camera = GMSCameraPosition.camera(withLatitude: 37.7749, longitude: -122.4194, zoom: 6)
        self.mappView.camera = camera
        self.mappView.isMyLocationEnabled = true

        
        let initialLocation = CLLocationCoordinate2DMake(37.7749, -122.4194)
        let marker = GMSMarker(position: initialLocation)
        marker.title = "San Francisco"
        marker.map = self.mappView
        
        
        self.mappView.settings.compassButton = true
        
        
        //map insets
        let mapInsets = UIEdgeInsetsMake(80.0, 0.0, 0.0, 0.0)
        self.mappView.padding = mapInsets
        
        
        //Line Drawing
        
        

//        //adding marker in the center of the map
//        let marker = GMSMarker()
//        marker.position = CLLocationCoordinate2D(latitude: -33.86, longitude: 151.20)
//        marker.title = "Sydney"
//        marker.snippet = "Australia"
//        marker.map = mappView
        
//        let mapInsets = UIEdgeInsets(top: 50, left: 0.0, bottom: 0.0, right: 50)
//        mappView.padding = mapInsets
        
    }

    override var shouldAutorotate: Bool {
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
}

