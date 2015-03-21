//
//  BuddiesButton.swift
//  ButtonClassTest
//
//  Created by Scott Seligman on 3/20/15.
//  Copyright (c) 2015 Scott Seligman. All rights reserved.
//

import UIKit
@IBDesignable
class BuddiesButton: UIButton {
    
    
    @IBInspectable
    var theOnColor: UIColor = UIColor.redColor(){
        didSet {
            updateLayerProperties()
        }
    }
    
    @IBInspectable
    var theOffColor: UIColor = UIColor.redColor(){
        didSet {
            updateLayerProperties()
        }
    }
    
    var isOn :Bool = false{
        didSet {
            if self.isOn {
                green()
            }else {
                red()
            }
        }
    }
    
    func updateLayerProperties(){
            if isOn {
                self.backgroundColor = theOnColor
            }else   {
                self.backgroundColor = theOffColor
            }
    
    }
    func circle(inFrame: CGRect) -> CGPath {
        let circle = UIBezierPath(ovalInRect: inFrame)
        return circle.CGPath
    }
    

    
    func green(){
        println("on")
        self.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        self.layoutIfNeeded()
            UIView.animateWithDuration(0.5, delay: 0.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 100, options: .CurveEaseOut, animations:{
                self.backgroundColor = self.theOnColor
                self.transform = CGAffineTransformMakeScale(1.0, 1.0)
            }, completion: nil)

    }
    func red(){
        println("off")
        self.setTitleColor(UIColor.redColor(), forState: UIControlState.Normal)
        self.layoutIfNeeded()
        UIView.animateWithDuration(0.2, delay: 0.0, usingSpringWithDamping: 1.0, initialSpringVelocity: 50, options: .CurveEaseOut, animations:{
            self.transform = CGAffineTransformMakeScale(0.9, 0.9)
            self.backgroundColor = self.theOffColor
            }, completion: nil)
    }
    
    override func layoutSubviews()
    {
        super.layoutSubviews()
        if self.isOn {
            green()
        }else {
            red()
        }
        updateLayerProperties()
    }
    
}