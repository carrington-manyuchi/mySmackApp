//
//  GradientView.swift
//  mySmackApp
//
//  Created by Manyuchi, Carrington C on 2025/03/15.
//

import Foundation

// Needs to know that it will work/render inside the storyboard.
@IBDesignable
class GradientView: UIView {
// to change inside storyboard
    @IBInspectable var topColor: UIColor = UIColor.blue {
        didSet {
            self.setNeedsLayout()
        }
    }
    
    @IBInspectable var bottomColor: UIColor = UIColor.green {
        didSet {
            self.setNeedsLayout()
        }
    }
    
//    it is called whenever we change our variables
    override func layoutSubviews() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [topColor.cgColor, bottomColor.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        gradientLayer.frame = self.bounds
        self.layer.insertSublayer(gradientLayer, at: 0)
    }
}
