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
    @IBOutlet weak var panBtn: MARoundButton!
    @IBOutlet weak var addAnotationBtn: MARoundButton!
    
    
    // MARK: View
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Setup MapBox MapView Tracking
        self.mapView.showsUserLocation = true
        self.mapView.userTrackingMode = .Follow
        
        setTintColors()
        
    }
    
    // MARK: Tint Colors
    func setTintColors() {
        // Change Information, UIButtons tint
        
        self.mapView.attributionButton.tintColor = UIColor.grayColor()
        self.addAnotationBtn.tintColor = UIColor.whiteColor()
        self.panBtn.tintColor = UIColor.lightGrayColor()
    }
    
    // MARK: IBActions
    
    @IBAction func panToUser() {
        
        
        // Sets userTrackingMode back to .Follow
        self.mapView.userTrackingMode = .Follow
        
        self.mapView.setCenterCoordinate((self.mapView.userLocation?.coordinate)!, zoomLevel: 14.0, direction: 0.0, animated: true) {
            
            // Ensure that mapview has a heading of 0
            self.mapView.resetNorth()
        }
        
        
    }
    
    @IBAction func placeMarker() {
        
        
        
        // Text Input Alert
        let alert = UIAlertController(title: "Location Name", message: nil, preferredStyle: .Alert)
        alert.addTextFieldWithConfigurationHandler({ (textField) in
            textField.placeholder = "Name"
            textField.addTarget(self, action: #selector(self.textChanged), forControlEvents: .EditingChanged)
        })
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel) { (_) in }
        
        let doneAction = UIAlertAction(title: "Done", style: .Default) { (_) in
            
            
            // Add Anotation for user selected location
            let pointOfInterest = MGLPointAnnotation()
            pointOfInterest.coordinate = self.mapView.convertPoint(self.mapView.center, toCoordinateFromView: self.mapView)
            pointOfInterest.title = alert.textFields![0].text
            self.mapView.addAnnotation(pointOfInterest)
            
            
            
        }
        
        
        alert.addAction(cancelAction)
        alert.addAction(doneAction)
        alert.actions[1].enabled = false
        alert.view.setNeedsLayout()
        self.presentViewController(alert, animated: true, completion: nil)
        
    }
    
  
    func textChanged(sender:AnyObject) {
        
        let tField = sender as! UITextField
        
        // Enable Done Button if text has been entered
        var responder : UIResponder! = tField
        
        while !(responder is UIAlertController) { responder = responder.nextResponder() }
        
        let alert = responder as! UIAlertController
        alert.actions[1].enabled = (tField.text != "")
        
    }
    
  
}

