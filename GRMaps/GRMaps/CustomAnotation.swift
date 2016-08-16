//
//  CustomAnotation.swift
//  GRMaps
//
//  Created by Tyler Miller on 8/16/16.
//  Copyright © 2016 Miller Apps. All rights reserved.
//

import UIKit
import Mapbox

class CustomAnotation: NSObject, MGLAnnotation {
    
    var coordinate: CLLocationCoordinate2D
    var title: String?
    var subtitle: String?
    
    // New properties for custom image
    var image: UIImage?
    var reuseIdentifier: String?
    
    init(coordinate: CLLocationCoordinate2D, title: String?, subtitle: String?) {
        
        self.coordinate = coordinate
        self.title = title
        self.subtitle = subtitle
    }
    
    
}
