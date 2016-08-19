//
//  GRLocationService.swift
//  GRMaps
//
//  Created by Tyler Miller on 8/19/16.
//  Copyright © 2016 Miller Apps. All rights reserved.
//

import Foundation
import Mapbox

struct GRLocationService {
    
    func parseDic(dic: [String: AnyObject]?) -> [GRLocations] {
        
        var grLocations: [GRLocations] = []
        
        if let dic = dic , locations = dic["places"] as? [[String: AnyObject]] {
            for place in locations {
                if let lat = place["lat"], long = place["long"], name = place["name"]  {
                    
                    
                    let placeCoord = CLLocationCoordinate2DMake(lat as! Double, long as! Double)
                    let placeName = name as! String
                    
                    let location = GRLocations(coordinates: placeCoord, name: placeName)
                    
                    
                    grLocations.append(location)
                    
                    print("Name: \(placeName), Coords: \(placeCoord)")
                    
                    
                }
            }
            
        }
        
        return grLocations
    }
}

