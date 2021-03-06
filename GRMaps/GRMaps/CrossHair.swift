//
//  CrossHair.swift
//  GRMaps
//
//  Created by Tyler Miller on 8/14/16.
//  Copyright (c) 2016 MillerApps. All rights reserved.
//
//  Generated by PaintCode (www.paintcodeapp.com)
//



import UIKit


public class CrossHair : NSObject {
    
    
    // Drawing Methods
    
    public class func drawCross() {
        
        // Color Declarations
        let color = UIColor(red: 1.000, green: 0.991, blue: 0.991, alpha: 1.000)
        let color2 = UIColor(red: 1.000, green: 1.000, blue: 1.000, alpha: 1.000)
        

        // BeamOne Drawing
        let beamOnePath = UIBezierPath(rect: CGRect(x: 12, y: 1, width: 3, height: 25))
        color2.setFill()
        beamOnePath.fill()
        
        
        // BeamTwo Drawing
        let beamTwoPath = UIBezierPath(rect: CGRect(x: 1, y: 12, width: 25, height: 3))
        color.setFill()
        beamTwoPath.fill()
        
        
        // Oval Drawing
        let ovalPath = UIBezierPath(ovalInRect: CGRect(x: 1, y: 1, width: 25, height: 25))
        UIColor.whiteColor().setStroke()
        ovalPath.lineWidth = 2
        ovalPath.stroke()
    }
    
    
    
}
