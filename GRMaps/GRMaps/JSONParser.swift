//
//  JSONParser .swift
//  GRMaps
//
//  Created by Tyler Miller on 8/19/16.
//  Copyright © 2016 Miller Apps. All rights reserved.
//

import Foundation

public class JSONParser {
    
    
    public class func parseJSON(path: String?) ->  [String: AnyObject]? {
        
        do {
            
            if let path = path {
                
                let data = try NSData(contentsOfFile: path, options: NSDataReadingOptions.DataReadingMappedIfSafe)
                
                
                let json = try NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments) as? [String: AnyObject]
                
                
                return json
            }
            
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        
        return nil
    }
    
    
}


