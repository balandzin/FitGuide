//
//  UIView + Ex.swift
//  FitGuide
//
//  Created by Антон Баландин on 8.05.24.
//

import UIKit

extension UIView {
    func addSubviews(_ views: [UIView]) {
        views.forEach { view in
            self.addSubview(view)
        }
    }
    
    func addVerticalGradientLayer() {
        let primaryColor = UIColor(
            //            red: 210/255,
            //            green: 109/255,
            //            blue: 128/255,
            //            alpha: 1
            
            red: 188/255,
            green: 225/255,
            blue: 215/255,
            alpha: 1
        )
        
        let secondaryColor = UIColor(
            //            red: 107/255,
            //            green: 148/255,
            //            blue: 230/255,
            //            alpha: 1
            
            red: 254/255,
            green: 254/255,
            blue: 255/255,
            alpha: 1
        )
        
        let gradient = CAGradientLayer()
        gradient.frame = bounds
        gradient.colors = [primaryColor.cgColor, secondaryColor.cgColor]
        gradient.locations = [0.0, 1.0]
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 0, y: 1)
        layer.insertSublayer(gradient, at: 0)
    }
}
