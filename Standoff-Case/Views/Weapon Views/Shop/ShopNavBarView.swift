//
//  ShopNavBarView.swift
//  Standoff-Case
//
//  Created by Andrey on 02.02.2023.
//

import UIKit

class ShopNavBarView: UIView {
    
    // MARK: - Properties
        
    private lazy var shopButton: UIButton = {
        let shopButton = UIButton(type: .system)
        shopButton.translatesAutoresizingMaskIntoConstraints = false
        shopButton.backgroundColor = .green
        shopButton.setTitle("МАГАЗИН", for: .normal)
        shopButton.setTitleColor(.white, for: .normal)
        shopButton.tag = 1
        shopButton.titleLabel?.font = UIFont(name: "Oswald", size: 18)
        return shopButton
    }()
    
    private lazy var promotionButton: UIButton = {
        let inventoryButton = UIButton(type: .system)
        inventoryButton.translatesAutoresizingMaskIntoConstraints = false
        inventoryButton.backgroundColor = .red
        inventoryButton.setTitle("АКЦИИ", for: .normal)
        inventoryButton.setTitleColor(.white, for: .normal)
        inventoryButton.tag = 0
        inventoryButton.titleLabel?.font = UIFont(name: "Oswald", size: 18)
        return inventoryButton
    }()
    
    private lazy var buttonStackView: UIStackView = {
        let buttonStackView = UIStackView()
        buttonStackView.translatesAutoresizingMaskIntoConstraints = false
        buttonStackView.axis = .horizontal
        buttonStackView.distribution  = .fillEqually
        buttonStackView.alignment = UIStackView.Alignment.leading
        return buttonStackView
    }()
    
    // MARK: - Life cycle

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureView()
    }

}

// MARK: - Extension

extension ShopNavBarView {
    
    private func configureView() {
        configureSubviews()
        configureConstraints()
    }
    
    private func configureSubviews() {
        addSubview(buttonStackView)
        buttonStackView.addArrangedSubview(shopButton)
        buttonStackView.addArrangedSubview(promotionButton)
    }
    
    private func configureConstraints() {
        NSLayoutConstraint.activate([
        
            buttonStackView.topAnchor.constraint(equalTo: topAnchor),
            buttonStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            buttonStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            buttonStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
        ])
    }
}
