//
//  ShopNavBarView.swift
//  Standoff-Case
//
//  Created by Andrey on 02.02.2023.
//

import UIKit

protocol ShopNavBarViewDelegate: AnyObject {
    func didSelect(index: Int)
}

class ShopNavBarView: UIView {
    
    // MARK: - Properties
    
    weak var delegate: ShopNavBarViewDelegate?
        
    private lazy var shopButton: UIButton = {
        let shopButton = UIButton(type: .system)
        shopButton.translatesAutoresizingMaskIntoConstraints = false
        shopButton.backgroundColor = .green
        shopButton.setTitle("МАГАЗИН", for: .normal)
        shopButton.setTitleColor(.white, for: .normal)
        shopButton.tag = 0
        shopButton.titleLabel?.font = UIFont(name: "Oswald", size: 18)
        shopButton.addTarget(self, action: #selector(didChangeSelected), for: .touchUpInside)
        return shopButton
    }()
    
    private lazy var promotionButton: UIButton = {
        let promotionButton = UIButton(type: .system)
        promotionButton.translatesAutoresizingMaskIntoConstraints = false
        promotionButton.backgroundColor = .red
        promotionButton.setTitle("АКЦИИ", for: .normal)
        promotionButton.setTitleColor(.white, for: .normal)
        promotionButton.tag = 1
        promotionButton.addTarget(self, action: #selector(didChangeSelected), for: .touchUpInside)
        promotionButton.titleLabel?.font = UIFont(name: "Oswald", size: 18)
        return promotionButton
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
    
    // MARK: - @objc funcs
    
    @objc
    private func didChangeSelected(_ sender: UIButton) {
        delegate?.didSelect(index: sender.tag)
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
