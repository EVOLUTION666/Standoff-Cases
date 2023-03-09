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
    
//    static func digitalNumbers(size: CGFloat) -> UIFont {
//        let font: UIFont? = .init(name: "DigitalNumbers-Regular", size: size)
//        return font ?? UIFont.init(name: "Oswald-Regular", size: size)!
//    }
}

extension UITextField {

enum PaddingSpace {
    case left(CGFloat)
    case right(CGFloat)
    case equalSpacing(CGFloat)
}

func addPadding(padding: PaddingSpace) {

    self.leftViewMode = .always
    self.layer.masksToBounds = true

    switch padding {

    case .left(let spacing):
        let leftPaddingView = UIView(frame: CGRect(x: 0, y: 0, width: spacing, height: self.frame.height))
        self.leftView = leftPaddingView
        self.leftViewMode = .always

    case .right(let spacing):
        let rightPaddingView = UIView(frame: CGRect(x: 0, y: 0, width: spacing, height: self.frame.height))
        self.rightView = rightPaddingView
        self.rightViewMode = .always

    case .equalSpacing(let spacing):
        let equalPaddingView = UIView(frame: CGRect(x: 0, y: 0, width: spacing, height: self.frame.height))
        // left
        self.leftView = equalPaddingView
        self.leftViewMode = .always
        // right
        self.rightView = equalPaddingView
        self.rightViewMode = .always
    }
}
}
