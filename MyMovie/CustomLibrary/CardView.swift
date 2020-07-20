//
//  CardView.swift
//  MyMovie
//
//  Created by Kiet Nguyen on 7/18/20.
//  Copyright © 2020 Kiet Nguyen. All rights reserved.
//

import UIKit

@IBDesignable class CardView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    @IBInspectable var shadowRadius: CGFloat = 0 {
        didSet {
            self.layer.shadowRadius = shadowRadius
            self.reduceLagWhenRender()
        }
    }
    
    @IBInspectable var shadowOpacity: Float = 0 {
        didSet {
            self.layer.shadowOpacity = shadowOpacity
            self.reduceLagWhenRender()
        }
    }
    
    @IBInspectable var shadowColor: UIColor = .white {
        didSet {
            self.layer.shadowColor = shadowColor.cgColor
            self.reduceLagWhenRender()
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            self.layer.cornerRadius = cornerRadius
            self.reduceLagWhenRender()
        }
    }
    
    @IBInspectable var shadowOffsetX: CGFloat = 0 {
        didSet {
            self.setShadowOffset(shadowOffsetX: shadowOffsetX, shadowOffsetY: shadowOffsetY)
            self.reduceLagWhenRender()
        }
    }
    
    @IBInspectable var shadowOffsetY: CGFloat = 0 {
        didSet {
            self.setShadowOffset(shadowOffsetX: shadowOffsetX, shadowOffsetY: shadowOffsetY)
            self.reduceLagWhenRender()
        }
    }
    
    func setShadowOffset(shadowOffsetX: CGFloat, shadowOffsetY: CGFloat) {
        self.layer.shadowOffset = CGSize(width: shadowOffsetX, height: shadowOffsetY)
        self.reduceLagWhenRender()
    }
    
    func reduceLagWhenRender() {
        self.layer.shouldRasterize = true;
        self.layer.rasterizationScale = UIScreen.main.scale;
    }

}
