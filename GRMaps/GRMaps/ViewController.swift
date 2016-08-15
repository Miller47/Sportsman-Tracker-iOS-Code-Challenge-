//
//  ViewController.swift
//  GRMaps
//
//  Created by Tyler Miller on 8/11/16.
//  Copyright © 2016 Miller Apps. All rights reserved.
//

import UIKit
import Mapbox


class ViewController: UIViewController, MGLMapViewDelegate {

    @IBOutlet var mapView: MGLMapView!
    var point = MGLPointAnnotation()
    
   
    
    // MARK: View
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Setup MapBox MapView Tracking
        self.mapView.showsUserLocation = true
        self.mapView.userTrackingMode = .Follow
        
        

        
        
        
        // Chnage Information tint 
        mapView.attributionButton.tintColor = UIColor.grayColor()
    
        
        
    }
    


    func mapView(mapView: MGLMapView, didUpdateUserLocation userLocation: MGLUserLocation?) {
//        point.coordinate =  self.mapView.convertPoint(self.mapView.center, toCoordinateFromView: self.mapView)
//        self.mapView.addAnnotation(point)
        
    }
   
    // MARK: IBActions
    
    @IBAction func panToUser() {
        
        //print(mapView.userLocation?.coordinate, mapView.zoomLevel, mapView.direction)
        
        self.mapView.setCenterCoordinate((mapView.userLocation?.coordinate)!, zoomLevel: 14.0, direction: 0.0, animated: true)
        // Sets userTrackingMode back to .Follow
        self.mapView.userTrackingMode = .Follow
    }
    
    @IBAction func placeMarker() {
        
        let pointOfInterest = MGLPointAnnotation()
        pointOfInterest.coordinate = self.mapView.convertPoint(self.mapView.center, toCoordinateFromView: self.mapView)
        pointOfInterest.title = "Test"
        mapView.addAnnotation(pointOfInterest)
    }
}

