//
//  ShopCollectionViewCell.swift
//  Standoff-Case
//
//  Created by Andrey on 03.02.2023.
//

import UIKit

class ShopCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Properties
    
    private lazy var backView: UIView = {
        let backView = UIView()
        backView.translatesAutoresizingMaskIntoConstraints = false
        backView.backgroundColor = UIColor(red: 0 / 255, green: 0 / 255, blue: 0 / 255, alpha: 0.3)
        return backView
    }()
    
    private lazy var caseName: UILabel = {
       let caseName = UILabel()
        caseName.translatesAutoresizingMaskIntoConstraints = false
        caseName.text = "FABLE CASE"
        caseName.textColor = .orange
        caseName.font = .oswald(size: 14)
        caseName.textAlignment = .center
        return caseName
    }()
    
    private lazy var underTitleLineView: UIView = {
       let underTitleLineView = UIView()
        underTitleLineView.translatesAutoresizingMaskIntoConstraints = false
        underTitleLineView.backgroundColor = .white
        return underTitleLineView
    }()
    
    private lazy var caseImageView: UIImageView = {
       let caseImageView = UIImageView()
        caseImageView.translatesAutoresizingMaskIntoConstraints = false
        caseImageView.image = UIImage(named: "case")
        caseImageView.contentMode = .scaleAspectFill
        caseImageView.clipsToBounds = true
        return caseImageView
    }()
    
    private lazy var goldIcon: UIImageView = {
        let goldIcon = UIImageView()
        goldIcon.image = UIImage(named: "gold")
        goldIcon.translatesAutoresizingMaskIntoConstraints = false
        goldIcon.contentMode = .scaleAspectFit
        return goldIcon
    }()
    
    private lazy var casePriceLabel: UILabel = {
       let casePriceLabel = UILabel()
        casePriceLabel.translatesAutoresizingMaskIntoConstraints = false
        casePriceLabel.text = "100"
        casePriceLabel.textColor = .white
        casePriceLabel.font = .oswald(size: 14)
        casePriceLabel.textAlignment = .center
        return casePriceLabel
    }()
    
    private lazy var underLineView: UIView = {
       let underTitleLineView = UIView()
        underTitleLineView.translatesAutoresizingMaskIntoConstraints = false
        underTitleLineView.backgroundColor = .orange
        return underTitleLineView
    }()
    
    
    
    // MARK: - Life cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureViewCell()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureViewCell()
    }
    
}

extension ShopCollectionViewCell {
    
    private func configureViewCell() {
        configureSubviews()
        configureConstraints()
    }
    
    private func configureSubviews() {
        addSubview(backView)
        backView.addSubview(caseImageView)
        backView.addSubview(underLineView)
        caseImageView.addSubview(caseName)
        caseImageView.addSubview(underTitleLineView)
        caseImageView.addSubview(goldIcon)
        caseName.addSubview(casePriceLabel)
    }
    
    private func configureConstraints() {
        NSLayoutConstraint.activate([
            
            backView.topAnchor.constraint(equalTo: topAnchor),
            backView.leadingAnchor.constraint(equalTo: leadingAnchor),
            backView.trailingAnchor.constraint(equalTo: trailingAnchor),
            backView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            caseImageView.topAnchor.constraint(equalTo: backView.topAnchor),
            caseImageView.leadingAnchor.constraint(equalTo: backView.leadingAnchor),
            caseImageView.trailingAnchor.constraint(equalTo: backView.trailingAnchor),
            
            underLineView.topAnchor.constraint(equalTo: caseImageView.bottomAnchor),
            underLineView.leadingAnchor.constraint(equalTo: backView.leadingAnchor),
            underLineView.trailingAnchor.constraint(equalTo: backView.trailingAnchor),
            underLineView.bottomAnchor.constraint(equalTo: backView.bottomAnchor),
            underLineView.heightAnchor.constraint(equalToConstant: 4),
            
            caseName.topAnchor.constraint(equalTo: caseImageView.topAnchor),
            caseName.leadingAnchor.constraint(equalTo: caseImageView.leadingAnchor),
            caseName.trailingAnchor.constraint(equalTo: caseImageView.trailingAnchor),
            
            underTitleLineView.topAnchor.constraint(equalTo: caseName.bottomAnchor),
            underTitleLineView.leadingAnchor.constraint(equalTo: caseImageView.leadingAnchor, constant: 8),
            underTitleLineView.trailingAnchor.constraint(equalTo: caseImageView.trailingAnchor, constant: -8),
            underTitleLineView.heightAnchor.constraint(equalToConstant: 0.5),
            
            goldIcon.bottomAnchor.constraint(equalTo: caseImageView.bottomAnchor),
            goldIcon.trailingAnchor.constraint(equalTo: casePriceLabel.leadingAnchor, constant: -4),
            
            casePriceLabel.bottomAnchor.constraint(equalTo: caseImageView.bottomAnchor),
            casePriceLabel.trailingAnchor.constraint(equalTo: caseImageView.trailingAnchor, constant: -6),
            
            
        ])
    }
}
