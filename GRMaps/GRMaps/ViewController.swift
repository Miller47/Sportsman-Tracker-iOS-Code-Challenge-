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
    
   
    
    // MARK: View
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Setup MapBox MapView Tracking
        self.mapView.showsUserLocation = true
        self.mapView.userTrackingMode = .Follow
        
        
        
        
        // Chnage Information tint 
        mapView.attributionButton.tintColor = UIColor.grayColor()
        
        
        
        
    }
    

    
   
    // MARK: IBActions
    
    @IBAction func panToUser() {
        
        //print(mapView.userLocation?.coordinate, mapView.zoomLevel, mapView.direction)
        
        self.mapView.setCenterCoordinate((mapView.userLocation?.coordinate)!, zoomLevel: 14.0, direction: 0.0, animated: true)
        // Sets userTrackingMode back to .Follow
        self.mapView.userTrackingMode = .Follow
    }
}

