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
    
    static var goldGradientLayer: CAGradientLayer {
        let gradient = CAGradientLayer()
        gradient.colors = [UIColor.goldGradientStart.cgColor, UIColor.goldGradientEnd.cgColor]
        gradient.startPoint = .init(x: 0, y: 1)
        gradient.endPoint = .init(x: 1, y: 0)
        return gradient
    }
    
}

extension UIView {
    func addGradient(with layer: CAGradientLayer, gradientFrame: CGRect? = nil, colorSet: [UIColor],
                     locations: [Double], startEndPoints: (CGPoint, CGPoint)? = nil) {
        layer.frame = gradientFrame ?? self.bounds
        layer.frame.origin = .zero

        let layerColorSet = colorSet.map { $0.cgColor }
        let layerLocations = locations.map { $0 as NSNumber }

        layer.colors = layerColorSet
//        layer.locations = layerLocations
        
        layer.startPoint = .init(x: 0, y: 1)
        layer.endPoint = .init(x: 1, y: 0)

//        if let startEndPoints = startEndPoints {
//            layer.startPoint = startEndPoints.0
//            layer.endPoint = startEndPoints.1
//        }

        self.layer.insertSublayer(layer, above: self.layer)
//        self.layer.zPosition = 0
    }
}
