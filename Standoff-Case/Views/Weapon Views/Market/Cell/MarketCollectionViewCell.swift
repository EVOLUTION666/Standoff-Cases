//
//  MarketCollectionViewCell.swift
//  Standoff-Case
//
//  Created by Andrey on 08.02.2023.
//

import UIKit

class MarketCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Properties
    
    private lazy var squareBackViewWeapon: UIView = {
        let squareBackView = UIView()
        squareBackView.translatesAutoresizingMaskIntoConstraints = false
        squareBackView.backgroundColor = .clear

        return squareBackView
    }()
    
    private lazy var weaponColorLineView: UIView = {
        let weaponColorLineView = UIView()
        weaponColorLineView.translatesAutoresizingMaskIntoConstraints = false
        weaponColorLineView.backgroundColor = .blue
        return weaponColorLineView
    }()
    
    private lazy var weaponNameLabel: UILabel = {
        let weaponNameLabel = UILabel()
        weaponNameLabel.translatesAutoresizingMaskIntoConstraints = false
        weaponNameLabel.textColor = .white
        weaponNameLabel.text = "ARK SCALE"
        weaponNameLabel.textAlignment = .left
        return weaponNameLabel
    }()
    
    private lazy var weaponIcon: UIImageView = {
        let weaponIcon = UIImageView()
        weaponIcon.translatesAutoresizingMaskIntoConstraints = false
        weaponIcon.image = UIImage(named: "akr")
        weaponIcon.contentMode = .scaleAspectFit
        weaponIcon.clipsToBounds = true
        return weaponIcon
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

// MARK: - Extension

extension MarketCollectionViewCell {
    
    private func configureViewCell() {
        configureSubviews()
        configureConstraints()
    }
    
    private func configureSubviews() {
        contentView.addSubview(squareBackViewWeapon)
        squareBackViewWeapon.addSubview(weaponIcon)
        squareBackViewWeapon.addSubview(weaponColorLineView)
        weaponColorLineView.addSubview(weaponNameLabel)
    }
    
    private func configureConstraints() {
        NSLayoutConstraint.activate([
            squareBackViewWeapon.topAnchor.constraint(equalTo: contentView.topAnchor),
            squareBackViewWeapon.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            squareBackViewWeapon.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            squareBackViewWeapon.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            weaponIcon.topAnchor.constraint(equalTo: squareBackViewWeapon.topAnchor),
            weaponIcon.leadingAnchor.constraint(equalTo: squareBackViewWeapon.leadingAnchor),
            weaponIcon.trailingAnchor.constraint(equalTo: squareBackViewWeapon.trailingAnchor),
            
            weaponColorLineView.topAnchor.constraint(equalTo: weaponIcon.bottomAnchor, constant: 0),
            weaponColorLineView.leadingAnchor.constraint(equalTo: squareBackViewWeapon.leadingAnchor),
            weaponColorLineView.trailingAnchor.constraint(equalTo: squareBackViewWeapon.trailingAnchor),
            weaponColorLineView.bottomAnchor.constraint(equalTo: squareBackViewWeapon.bottomAnchor),
            
            weaponNameLabel.topAnchor.constraint(equalTo: weaponColorLineView.topAnchor),
            weaponNameLabel.leadingAnchor.constraint(equalTo: weaponColorLineView.leadingAnchor),
            weaponNameLabel.trailingAnchor.constraint(equalTo: weaponColorLineView.trailingAnchor),
            weaponNameLabel.bottomAnchor.constraint(equalTo: weaponColorLineView.bottomAnchor),
        ])
    }
}
