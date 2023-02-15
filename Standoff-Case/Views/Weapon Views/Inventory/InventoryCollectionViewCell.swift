//
//  InventoryCollectionViewCell.swift
//  Standoff-Case
//
//  Created by Andrey on 29.01.2023.
//

import UIKit

class InventoryCollectionViewCell: UICollectionViewCell {
    
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
        weaponColorLineView.backgroundColor = .blueGradientStart
        return weaponColorLineView
    }()
    
    private lazy var weaponNameLabel: UILabel = {
        let weaponNameLabel = UILabel()
        weaponNameLabel.translatesAutoresizingMaskIntoConstraints = false
        weaponNameLabel.textColor = .textPrimary
        weaponNameLabel.text = "ARK Scale"
        weaponNameLabel.font = .oswald(size: 10)
        weaponNameLabel.textAlignment = .left
        return weaponNameLabel
    }()
    
    private lazy var weaponIcon: UIImageView = {
        let weaponIcon = UIImageView()
        weaponIcon.translatesAutoresizingMaskIntoConstraints = false
        weaponIcon.image = UIImage(named: "akr")
        weaponIcon.contentMode = .scaleAspectFill
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

extension InventoryCollectionViewCell {
    
    private func configureViewCell() {
        configureSubviews()
        configureConstraints()
    }
    
    private func configureSubviews() {
        contentView.addSubview(squareBackViewWeapon)
        squareBackViewWeapon.backgroundColor = .gray2With30Alpha
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
            
            weaponColorLineView.topAnchor.constraint(equalTo: weaponIcon.bottomAnchor),
            weaponColorLineView.leadingAnchor.constraint(equalTo: squareBackViewWeapon.leadingAnchor),
            weaponColorLineView.trailingAnchor.constraint(equalTo: squareBackViewWeapon.trailingAnchor),
            weaponColorLineView.bottomAnchor.constraint(equalTo: squareBackViewWeapon.bottomAnchor),
            weaponColorLineView.heightAnchor.constraint(equalToConstant: 20),
            
            weaponNameLabel.topAnchor.constraint(equalTo: weaponColorLineView.topAnchor),
            weaponNameLabel.leadingAnchor.constraint(equalTo: weaponColorLineView.leadingAnchor, constant: 5),
            weaponNameLabel.trailingAnchor.constraint(equalTo: weaponColorLineView.trailingAnchor),
            weaponNameLabel.bottomAnchor.constraint(equalTo: weaponColorLineView.bottomAnchor),
        ])
    }
}
