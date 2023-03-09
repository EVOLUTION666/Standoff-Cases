//
//  CoefficientViewCell.swift
//  Standoff-Case
//
//  Created by Andrey on 26.02.2023.
//

import UIKit

class CoefficientViewCell: UICollectionViewCell {
    
    // MARK: - Properties
    
    private lazy var colorView: UIView = {
       let colorView = UIView()
        colorView.translatesAutoresizingMaskIntoConstraints = false
        colorView.backgroundColor = .green
        return colorView
    }()
    
    private lazy var coeffLabel: UILabel = {
       let coeffLabel = UILabel()
        coeffLabel.translatesAutoresizingMaskIntoConstraints = false
        coeffLabel.font = .oswald(size: 11)
        coeffLabel.textColor = .white
        coeffLabel.text = "5.27"
        return coeffLabel
    }()
    
    // MARK: - Life cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureCell()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureCell()
    }
}

// MARK: - Extension

extension CoefficientViewCell {
    
    private func configureCell() {
        configureSubviews()
        configureConstraints()
    }
    
    private func configureSubviews() {
        contentView.addSubview(colorView)
        colorView.addSubview(coeffLabel)
    }
    
    private func configureConstraints() {
        NSLayoutConstraint.activate([
        
            colorView.topAnchor.constraint(equalTo: contentView.topAnchor),
            colorView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            colorView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            colorView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            coeffLabel.centerYAnchor.constraint(equalTo: colorView.centerYAnchor),
            coeffLabel.centerXAnchor.constraint(equalTo: colorView.centerXAnchor),
        
        ])
    }
}
