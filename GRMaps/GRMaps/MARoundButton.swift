//
//  MARoundButton.swift
//  
//
//  Created by Tyler Miller on 8/12/16.
//  Copyright © 2016 Miller Apps. All rights reserved.
//

import UIKit

@IBDesignable class MARoundButton: UIButton {
    
    @IBInspectable var corner: CGFloat = 0
    @IBInspectable var border: CGFloat = 0
    @IBInspectable var borderColor: UIColor?
    @IBInspectable var borderAlpha: CGFloat = 1.0
    
    override func drawRect(rect: CGRect) {
        
        self.layer.cornerRadius = corner
        self.layer.borderWidth = border
        self.layer.masksToBounds = true
        guard let color = borderColor else {
            print("Use no color")
            // Sets borderWidth to 0 if no color is picked, in order to prevent unwanted black borders.
            self.layer.borderWidth = 0
            return
        }
        self.layer.borderColor = color.colorWithAlphaComponent(borderAlpha).CGColor
            
        
    }
    
    
}

