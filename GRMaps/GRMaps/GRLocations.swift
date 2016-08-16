//
//  GRLocations.swift
//  GRMaps
//
//  Created by Tyler Miller on 8/16/16.
//  Copyright © 2016 Miller Apps. All rights reserved.
//

import Mapbox

struct GRLocations {
    
    let coordinates: CLLocationCoordinate2D
    let name: String
    
    init(coordinates: CLLocationCoordinate2D, name: String) {
        
        self.coordinates = coordinates
        self.name = name
    }
}
