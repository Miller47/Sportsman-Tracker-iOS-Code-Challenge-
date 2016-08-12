//
//  ViewController.swift
//  GRMaps
//
//  Created by Tyler Miller on 8/11/16.
//  Copyright © 2016 Miller Apps. All rights reserved.
//

import UIKit
import Mapbox


class ViewController: UIViewController {

    @IBOutlet var mapView: MGLMapView!
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Setup MapBox MapView Tracking
        mapView.showsUserLocation = true
        mapView.userTrackingMode = .Follow
        
        // Chnage Information tint 
        mapView.attributionButton.tintColor = UIColor.grayColor()
        
        
    }
    
   
    
    @IBAction func panToUser() {
    }
}

