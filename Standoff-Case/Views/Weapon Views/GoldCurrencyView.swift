//
//  GoldCurrencyView.swift
//  Standoff-Case
//
//  Created by Andrey on 28.01.2023.
//

import UIKit

class GoldCurrencyView: UIView {
    
    //MARK: - Properties
    
    private let gradient = CAGradientLayer.goldGradientLayer
    
    private lazy var goldIcon: UIImageView = {
        let goldIcon = UIImageView()
        goldIcon.image = UIImage(named: "gold")
        goldIcon.translatesAutoresizingMaskIntoConstraints = false
        goldIcon.contentMode = .scaleAspectFit
        goldIcon.setSize(width: 10, height: 10)
        
        return goldIcon
    }()
    
    private lazy var valueText: UILabel = {
        let valueText = UILabel()
        valueText.text = "100000000"
        valueText.font = .oswald(size: 12, weight: .light)
        valueText.textAlignment = .center
        valueText.textColor = .textPrimary
        valueText.translatesAutoresizingMaskIntoConstraints = false
        return valueText
    }()
    
    private lazy var plusIcon: UIImageView = {
        let plusIcon = UIImageView()
        plusIcon.image = UIImage(named: "plus")
        plusIcon.translatesAutoresizingMaskIntoConstraints = false
        plusIcon.contentMode = .scaleAspectFit
        plusIcon.setSize(width: 10, height: 10)
        return plusIcon
    }()
    
    private lazy var blackView: UIView = {
       let blackView = UIView()
        blackView.backgroundColor = .goldSquare
        blackView.translatesAutoresizingMaskIntoConstraints = false
        return blackView
    }()
    
    private lazy var generalStackView: UIStackView = {
        let generalStackView = UIStackView()
        generalStackView.translatesAutoresizingMaskIntoConstraints = false
        generalStackView.axis = .horizontal
        generalStackView.distribution = .fill
        generalStackView.spacing = 2
        generalStackView.alignment = .center
        return generalStackView
    }()
    
    //MARK: - Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureView()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        gradient.frame = self.bounds
    }
    
}

//MARK: - Extension

extension GoldCurrencyView {
    
    private func configureView() {
        self.layer.addSublayer(gradient)
        configureSubviews()
        configureConstraints()
    }
    
    private func configureSubviews() {
        addSubview(generalStackView)
        blackView.addSubview(plusIcon)
        generalStackView.addArrangedSubview(goldIcon)
        generalStackView.addArrangedSubview(valueText)
        generalStackView.addArrangedSubview(blackView)
    }
    
    private func configureConstraints() {
        NSLayoutConstraint.activate([
            
            generalStackView.topAnchor.constraint(equalTo: topAnchor),
            generalStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            generalStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            generalStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            blackView.heightAnchor.constraint(equalTo: self.heightAnchor),
            blackView.widthAnchor.constraint(equalTo: blackView.heightAnchor),
            
            plusIcon.centerYAnchor.constraint(equalTo: blackView.centerYAnchor),
            plusIcon.centerXAnchor.constraint(equalTo: blackView.centerXAnchor),
            
        ])
    }
}
