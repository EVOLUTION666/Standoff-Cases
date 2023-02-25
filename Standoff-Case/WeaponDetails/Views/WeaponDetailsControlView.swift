//
//  WeaponDetailsControlView.swift
//  Standoff-Case
//
//  Created by Astemir Shibzuhov on 2/8/23.
//

import UIKit

class WeaponDetailsControlView: UIView {
    
    var backButtonAction: (() -> ())?
    
    private lazy var backButton: UIButton = {
        let btn = UIButton().forAutoLayout()
        btn.setTitle("Назад", for: .normal)
        return btn
    }()
    
    
    @objc
    private func didTapBackButton() {
        
    }
}
