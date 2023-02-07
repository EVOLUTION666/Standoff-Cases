//
//  GoldCurrencyView.swift
//  Standoff-Case
//
//  Created by Andrey on 28.01.2023.
//

import UIKit

class GoldCurrencyView: UIView {
    
    //MARK: - Properties
    
    private lazy var goldIcon: UIImageView = {
        let goldIcon = UIImageView()
        goldIcon.image = UIImage(named: "gold")
        goldIcon.translatesAutoresizingMaskIntoConstraints = false
        goldIcon.contentMode = .scaleAspectFit
//        goldIcon.widthAnchor.constraint(equalToConstant: 20).isActive = true
//        goldIcon.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        return goldIcon
    }()
    
    private lazy var valueText: UILabel = {
        let valueText = UILabel()
        valueText.text = "100"
        valueText.textAlignment = .center
        valueText.translatesAutoresizingMaskIntoConstraints = false
        return valueText
    }()
    
    private lazy var plusIcon: UIImageView = {
        let plusIcon = UIImageView()
        plusIcon.image = UIImage(named: "plus")
        plusIcon.translatesAutoresizingMaskIntoConstraints = false
        plusIcon.contentMode = .scaleAspectFit
        plusIcon.widthAnchor.constraint(equalToConstant: 20).isActive = true
        plusIcon.heightAnchor.constraint(equalToConstant: 20).isActive = true
        return plusIcon
    }()
    
    private lazy var blackView: UIView = {
       let blackView = UIView()
        blackView.backgroundColor = .black
        blackView.translatesAutoresizingMaskIntoConstraints = false
        blackView.layer.opacity = 0.3
        return blackView
    }()
    
    private lazy var generalStackView: UIStackView = {
        let generalStackView = UIStackView()
        generalStackView.translatesAutoresizingMaskIntoConstraints = false
        generalStackView.axis = .horizontal
        generalStackView.distribution = .fill
        generalStackView.alignment = .fill
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
    
}

//MARK: - Extension

extension GoldCurrencyView {
    
    private func configureView() {
        backgroundColor = .yellow
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
            generalStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            generalStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            generalStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            blackView.heightAnchor.constraint(equalTo: self.heightAnchor),
            blackView.widthAnchor.constraint(equalTo: blackView.heightAnchor),
            
            
//            plusIcon.topAnchor.constraint(equalTo: blackView.topAnchor),
//            plusIcon.leadingAnchor.constraint(equalTo: blackView.leadingAnchor),
//            plusIcon.trailingAnchor.constraint(equalTo: blackView.trailingAnchor),
//            plusIcon.bottomAnchor.constraint(equalTo: blackView.bottomAnchor),
            
            plusIcon.centerYAnchor.constraint(equalTo: blackView.centerYAnchor),
            plusIcon.centerXAnchor.constraint(equalTo: blackView.centerXAnchor),
            
        ])
    }
}
