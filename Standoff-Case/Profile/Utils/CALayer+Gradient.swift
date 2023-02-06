//
//  CALayer+Gradient.swift
//  Standoff-Case
//
//  Created by Astemir Shibzuhov on 2/6/23.
//

import UIKit

extension CALayer {
    static var baseGradientLayer: CAGradientLayer {
        let gradient = CAGradientLayer()
        gradient.colors = [UIColor.baseGradientStart.cgColor, UIColor.baseGradientEnd.cgColor]
        gradient.startPoint = .init(x: 0, y: 1)
        gradient.endPoint = .init(x: 1, y: 0)
        return gradient
    }
    
    static var blueGradientLayer: CAGradientLayer {
        let gradient = CAGradientLayer()
        gradient.colors = [UIColor.blueGradientStart.cgColor, UIColor.blueGradientEnd.cgColor]
        gradient.startPoint = .init(x: 0, y: 0.5)
        gradient.endPoint = .init(x: 1, y: 0.5)
        return gradient
    }
}
