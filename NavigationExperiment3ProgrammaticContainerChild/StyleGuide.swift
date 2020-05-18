//
//  UiView+Extension.swift
//  NavigationExperiment3ProgrammaticContainerChild
//
//  Created by Albert Yu on 5/12/20.
//  Copyright © 2020 AlbertDemo. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    func setGradeientBackground(colorOne: UIColor, colorTwo: UIColor, colorThree: UIColor){
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.colors = [colorOne.cgColor, colorOne.cgColor, colorTwo.cgColor, colorThree.cgColor, colorThree.cgColor]
        gradientLayer.locations = [0.0, 0.2, 0.45, 0.8, 1.0]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 1.0)
        gradientLayer.endPoint = CGPoint(x:1.0, y: 1.0)
        
        layer.insertSublayer(gradientLayer, at: 0)
    }
}

extension UIColor {
    static let sasssy = UIColor(named: "Sasssy")!
    static let surfsUp = UIColor(named: "Surfs Up")!
    static let greenApples = UIColor(named: "Green Apples")!
    static let perfectOrange = UIColor(named: "Perfect Orange")!
    static let vibe = UIColor(named: "Vibe")!
    
}
