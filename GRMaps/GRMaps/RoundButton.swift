//
//  RoundButton.swift
//  GRMaps
//
//  Created by Tyler Miller on 8/12/16.
//  Copyright © 2016 Miller Apps. All rights reserved.
//

import UIKit

@IBDesignable class RoundButton: UIButton {
    
    @IBInspectable var corner: CGFloat = 0
    
    override func drawRect(rect: CGRect) {
        
        self.layer.cornerRadius = corner 
        self.layer.masksToBounds = true
    }
    
    
}

