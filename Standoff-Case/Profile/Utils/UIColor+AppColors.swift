//
//  UIColor+AppColors.swift
//  Standoff-Case
//
//  Created by Astemir Shibzuhov on 2/6/23.
//

import UIKit

extension UIColor {
    // #F2835D
    static var baseGradientStart: UIColor {
        .init(named: "baseGradientStart") ?? .clear
    }
    
    // #281F83
    static var baseGradientEnd: UIColor {
        .init(named: "baseGradientEnd") ?? .clear
    }
    
    // #000000 - 40%
    static var blackWith40Alpha: UIColor {
        .init(named: "blackWith40Alpha") ?? .clear
    }
    
    // #000000 - 50%
    static var blackWith50Alpha: UIColor {
        .init(named: "blackWith50Alpha") ?? .clear
    }
    
    // #000000 - 70%
    static var blackWith70Alpha: UIColor {
        .init(named: "blackWith70Alpha") ?? .clear
    }
    
    // #747474 - 30%
    static var gray2With30Alpha: UIColor {
        .init(named: "gray2With30Alpha") ?? .clear
    }
    
    // #434343 - 30%
    static var grayWith30Alpha: UIColor {
        .init(named: "grayWith30Alpha") ?? .clear
    }
    
    // #000000 - 20%
    static var blackWith20Alpha: UIColor {
        .init(named: "blackWith20Alpha") ?? .clear
    }
    
    // #000000 - 15%
    static var blackWith15Alpha: UIColor {
        .init(named: "blackWith15Alpha") ?? .clear
    }
    
    // #156F9E
    static var blueGradientEnd: UIColor {
        .init(named: "blueGradientEnd") ?? .clear
    }
    
    // #30445A
    static var blueGradientStart: UIColor {
        .init(named: "blueGradientStart") ?? .clear
    }
    
    // #D19000
    static var accentOrange: UIColor {
        .init(named: "accentOrange") ?? .clear
    }
    
    // #FFFFFF
    static var textPrimary: UIColor {
        .init(named: "textPrimary") ?? .clear
    }

}

extension UIColor {
    convenience init(hex:String) {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }

        if ((cString.count) != 6) {
            self.init(white: 0, alpha: 0)
        }

        var rgbValue:UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)

        self.init(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
}
