//
//  UIFont + Ext.swift
//  Standoff-Case
//
//  Created by Andrey on 03.02.2023.
//

import UIKit

extension UIFont {
    static func oswald(size: CGFloat, weight: UIFont.Weight = .regular) -> UIFont {
        
        var font: UIFont? = UIFont.systemFont(ofSize: size, weight: weight)
        
        switch weight {
        case .bold:
            font = .init(name: "Oswald-Bold", size: size)
        case .ultraLight:
            font = .init(name: "Oswald-ExtraLight", size: size)
        case .light:
            font = .init(name: "Oswald-Light", size: size)
        case .medium:
            font = .init(name: "Oswald-Medium", size: size)
        case .regular:
            font = .init(name: "Oswald-Regular", size: size)
        case .semibold:
            font = .init(name: "Oswald-SemiBold", size: size)
        default:
            return font!
        }
        
        return font!
    }
}
