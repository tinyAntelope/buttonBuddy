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
    
    private var buttShape: CAShapeLayer!
    
    @IBInspectable
    var theColor: UIColor = UIColor.redColor(){
        didSet {
            updateLayerProperties()
        }
    }
    
    @IBInspectable
    var theOtherColor: UIColor = UIColor.redColor(){
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
        if buttShape != nil{
            if isOn {
                buttShape.fillColor = theColor.CGColor}
            else   {
                buttShape.fillColor = theOtherColor.CGColor
            }
        }
    }
    func circle(inFrame: CGRect) -> CGPath {
        let circle = UIBezierPath(ovalInRect: inFrame)
        return circle.CGPath
    }
    
    private func buildButton() {
        if buttShape == nil{
            buttShape = CAShapeLayer()
            buttShape.path = circle(CGRectInset(self.bounds, 0, 0))
            buttShape.bounds = self.bounds
            buttShape.position = CGPoint(x: CGRectGetWidth(self.bounds)/2, y: CGRectGetHeight(self.bounds)/2)
            buttShape.fillColor = theColor.CGColor
            self.layer.addSublayer(buttShape)
        }
    }
    
    func green(){
        println("on")
        if buttShape != nil{
            buttShape.fillColor = theColor.CGColor
            let starFillColor = CABasicAnimation(keyPath: "fillColor")
            starFillColor.toValue = theColor.CGColor
            starFillColor.duration = 0.2
            buttShape.addAnimation(starFillColor, forKey: nil)
            buttShape.fillColor = theColor.CGColor
        }
    }
    func red(){
        println("off")
        if buttShape != nil{
            buttShape.fillColor = theOtherColor.CGColor
            let starFillColor = CABasicAnimation(keyPath: "fillColor")
            starFillColor.toValue = theOtherColor.CGColor
            starFillColor.duration = 0.2
            buttShape.addAnimation(starFillColor, forKey: nil)
            buttShape.fillColor = theOtherColor.CGColor
        }
    }
    
    override func layoutSubviews()
    {
        super.layoutSubviews()
        buildButton()
        updateLayerProperties()
    }
    
}