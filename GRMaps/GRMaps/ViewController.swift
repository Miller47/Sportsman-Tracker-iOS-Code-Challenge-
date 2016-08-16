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
    
    var places: [GRLocations] = []
    
    
    // MARK: View
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Setup MapBox MapView Tracking
        self.mapView.showsUserLocation = true
        self.mapView.userTrackingMode = .Follow
        
        setTintColors()
        getJsonForPloting()
        
        
    }
    
    
    
    // MARK: Tint Colors
    func setTintColors() {
        
        // Change Information, UIButtons tint
        // Called again when UIAlertController actions are tapped
        // works around a bug with tintColor changing to the tintColor of the MGLMapView
        
        self.mapView.attributionButton.tintColor = UIColor.grayColor()
        self.addAnotationBtn.tintColor = UIColor.whiteColor()
        self.panBtn.tintColor = UIColor.lightGrayColor()
        
    }
    
    // MARK: Plot Pins
    
    func getJsonForPloting() {
        
        // Get ref to local JSON file
        if let path = NSBundle.mainBundle().pathForResource("MapData", ofType: "json") {
            
            print(path)
            do {
                
                let data = try NSData(contentsOfFile: path, options: NSDataReadingOptions.DataReadingMappedIfSafe)
                let json = try NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments)
                
                if let locations = json["places"] as? [[String: AnyObject]] {
                    for place in locations {
                        if let lat = place["lat"], long = place["long"], name = place["name"]  {
                            let placeCoord = CLLocationCoordinate2DMake(lat as! Double, long as! Double)
                            let placeName = name as! String
                            
                            let location = GRLocations(coordinates: placeCoord, name: placeName)
                            
                            // Append loctions to plces Array
                            places.append(location)
                            
                            print("Name: \(placeName), Coords: \(placeCoord)")
                            
                        }
                    }
                }
                
                
                
            } catch let error as NSError {
                print(error.localizedDescription)
            }
            
        }
        
        poltPins()
    }
    
    

    
    func poltPins() {
        
        // Plot Annotation based on coordinates from JSON
        // Loop through places to egt all locations
        for place in places {
            
            let coordinates = place.coordinates
            let name = place.name
            
            // Create Annotation
            let annotation = CustomAnotation(coordinate: coordinates, title: name, subtitle: nil)
            
            // Set reuseIdentifer and image
            annotation.reuseIdentifier = "pin"
            annotation.image = UIImage(named: "pin-poi")
            
            self.mapView.addAnnotation(annotation)
        }
        
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
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel) { (_) in
            
            self.setTintColors()
        }
        
        let doneAction = UIAlertAction(title: "Done", style: .Default) { (_) in
            
            
            // Add Anotation for user selected location
            let point = self.mapView.convertPoint(self.mapView.center, toCoordinateFromView: self.mapView)
            let pointTitle = alert.textFields![0].text
            let pointOfInterest = CustomAnotation(coordinate: point, title: pointTitle, subtitle: nil)
            
            // Set Image and reuseIdentifier
            pointOfInterest.image = UIImage(named: "user-pin")
            pointOfInterest.reuseIdentifier = "userPoint"
            
            self.mapView.addAnnotation(pointOfInterest)
            
            
            self.setTintColors()
            
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
    
    // MARK: MGLAnotation
    
    func mapView(mapView: MGLMapView, imageForAnnotation annotation: MGLAnnotation) -> MGLAnnotationImage? {
        
        if let point = annotation as? CustomAnotation, image = point.image, reuseIdentifer = point.reuseIdentifier {
            
            if let annotationImg = mapView.dequeueReusableAnnotationImageWithIdentifier(reuseIdentifer) {
                // Use previsously created
                return annotationImg
            } else {
                // Create new
                return MGLAnnotationImage(image: image, reuseIdentifier: reuseIdentifer)
            }
            
        }
        
        return nil
    }
    
    func mapView(mapView: MGLMapView, annotationCanShowCallout annotation: MGLAnnotation) -> Bool {
        
        return true
    }
    
}

