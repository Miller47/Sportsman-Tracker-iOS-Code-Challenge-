//
//  CrossHairView.swift
//  GRMaps
//
//  Created by Tyler Miller on 8/14/16.
//  Copyright © 2016 Miller Apps. All rights reserved.
//

import UIKit

@IBDesignable class CrossHairView: UIView {
    
    override func drawRect(rect: CGRect) {
        super.drawRect(rect)
        
        CrossHair.drawCross()
    }

}
