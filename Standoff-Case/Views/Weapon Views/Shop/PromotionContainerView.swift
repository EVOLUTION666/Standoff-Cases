//
//  PromotionContainerView.swift
//  Standoff-Case
//
//  Created by Andrey on 06.02.2023.
//

import UIKit

class PromotionContainerView: UIView {
    
    // MARK: - Properties
    
    private lazy var label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Список акций пуст".uppercased()
        label.font = .oswald(size: 20)
        label.textColor = .textPrimary
        return label
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

extension PromotionContainerView {
    
    private func configureView() {
        configureSubviews()
        configureConstraints()
    }
    
    private func configureSubviews() {
        addSubview(label)
    }
    
    private func configureConstraints() {
        
        NSLayoutConstraint.activate([
        
            label.centerXAnchor.constraint(equalTo: centerXAnchor),
            label.centerYAnchor.constraint(equalTo: centerYAnchor),
        
        ])
    }
}
