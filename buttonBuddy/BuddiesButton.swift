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
    var defaultState: Bool = false{
        didSet {
            isOn = defaultState
        }
    }
    @IBInspectable
    var theOnColor: UIColor = UIColor.redColor(){
        didSet {
            updateLayerProperties()
        }
    }
    @IBInspectable
    var fontOnColor: UIColor = UIColor.blackColor(){
        didSet {
            updateLayerProperties()
        }
    }
    @IBInspectable
    var fontOffColor: UIColor = UIColor.lightGrayColor(){
        didSet {
            updateLayerProperties()
        }
    }
    @IBInspectable
    var theOffColor: UIColor = UIColor.darkGrayColor(){
        didSet {
            updateLayerProperties()
        }
    }
    var isOn :Bool = false{
        didSet {
            if self.isOn {
                buttonOn()
            }else {
                buttonOff()
            }
        }
    }
    func updateLayerProperties(){
        if isOn {
            self.backgroundColor = theOnColor
            self.setTitleColor(fontOnColor, forState: UIControlState.Normal)
        }else   {
            self.backgroundColor = theOffColor
            self.setTitleColor(fontOffColor, forState: UIControlState.Normal)
        }
        
    }
    
    func buttonOn(){

        self.setTitleColor(fontOnColor, forState: UIControlState.Normal)
        self.layoutIfNeeded()
        UIView.animateWithDuration(0.75, delay: 0.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 100, options: .CurveEaseOut, animations:{
            self.backgroundColor = self.theOnColor
            self.transform = CGAffineTransformMakeScale(1.0, 1.0)
            }, completion: nil)
    }
    func buttonOff(){
        self.setTitleColor(fontOffColor, forState: UIControlState.Normal)
        self.layoutIfNeeded()
        UIView.animateWithDuration(0.2, delay: 0.0, usingSpringWithDamping: 1.0, initialSpringVelocity: 50, options: .CurveEaseOut, animations:{
            self.transform = CGAffineTransformMakeScale(0.9, 0.9)
            self.backgroundColor = self.theOffColor
            }, completion: nil)
    }
    
    override func layoutSubviews()
    {
        super.layoutSubviews()
        updateLayerProperties()
    }
}