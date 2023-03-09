//
//  PlayerBetViewCell.swift
//  Standoff-Case
//
//  Created by Andrey on 04.03.2023.
//

import UIKit

class PlayerBetViewCell: UITableViewCell {
    
    // MARK: - Properties
    
    static let identifier = "playersBetCell"
    
    private lazy var backView: UIView = {
       let backView = UIView()
        backView.translatesAutoresizingMaskIntoConstraints = false
//        backView.backgroundColor = .orange
        backView.layer.cornerRadius = 5
        backView.layer.masksToBounds = true
        return backView
    }()
    
    private lazy var avatarImage: UIImageView = {
       let avatarImage = UIImageView()
        avatarImage.translatesAutoresizingMaskIntoConstraints = false
        avatarImage.image = UIImage(named: "avatarPlaceholder")
        avatarImage.layer.cornerRadius = 5
        avatarImage.layer.masksToBounds = true
        return avatarImage
    }()
    
    private lazy var priceView: UIView = {
       let priceView = UIView()
        priceView.translatesAutoresizingMaskIntoConstraints = false
        priceView.backgroundColor = .blackWith35Alpha
        priceView.layer.cornerRadius = 5
        priceView.layer.masksToBounds = true
        return priceView
    }()
    
    private lazy var priceStackView: UIStackView = {
       let priceStackView = UIStackView(arrangedSubviews: [goldIcon, priceLabel])
        priceStackView.translatesAutoresizingMaskIntoConstraints = false
        priceStackView.axis = .horizontal
        priceStackView.spacing = 3
        return priceStackView
    }()
    
    private lazy var goldIcon: UIImageView = {
       let goldIcon = UIImageView()
        goldIcon.translatesAutoresizingMaskIntoConstraints = false
        goldIcon.image = UIImage(named: "gold")
        return goldIcon
    }()
    
    private lazy var priceLabel: UILabel = {
       let priceLabel = UILabel()
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.text = "300.0"
        priceLabel.textColor = .white
        priceLabel.font = .oswald(size: 8)
        return priceLabel
    }()
    
    private lazy var weaponImage1: UIImageView = {
        let weaponImage1 = UIImageView()
        weaponImage1.translatesAutoresizingMaskIntoConstraints = false
        weaponImage1.image = UIImage(named: "akr")
        weaponImage1.contentMode = .scaleAspectFill
        weaponImage1.clipsToBounds = true
        return weaponImage1
    }()
    
    private lazy var weaponImage2: UIImageView = {
        let weaponImage2 = UIImageView()
        weaponImage2.translatesAutoresizingMaskIntoConstraints = false
        weaponImage2.image = UIImage(named: "akr")
        weaponImage2.contentMode = .scaleAspectFill
        weaponImage2.clipsToBounds = true
        return weaponImage2
    }()

    private lazy var weaponImage3: UIImageView = {
        let weaponImage3 = UIImageView()
        weaponImage3.translatesAutoresizingMaskIntoConstraints = false
        weaponImage3.image = UIImage(named: "akr")
        weaponImage3.contentMode = .scaleAspectFill
        weaponImage3.clipsToBounds = true
        return weaponImage3
    }()
    
    private lazy var inGameView: UIView = {
       let inGameView = UIView()
        inGameView.translatesAutoresizingMaskIntoConstraints = false
        inGameView.backgroundColor = .blackWith35Alpha
        inGameView.layer.cornerRadius = 5
        inGameView.layer.masksToBounds = true
        return inGameView
    }()

    private lazy var inGameLabel: UILabel = {
       let inGameLabel = UILabel()
        inGameLabel.translatesAutoresizingMaskIntoConstraints = false
        inGameLabel.text = "В игре"
        inGameLabel.textColor = .white
        inGameLabel.text = inGameLabel.text?.uppercased()
        inGameLabel.font = .oswald(size: 10)
        return inGameLabel
    }()
    
    // MARK: - Life cycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureCell()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        configureCell()
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 5, left: 5, bottom: 0, right: 5))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    let gradientLayer = CAGradientLayer()
    
    // Setting it from layoutSubViews also fine.
    override func layoutSublayers(of layer: CALayer) {
        super.layoutSublayers(of: self.layer)
        gradientLayer.frame = contentView.bounds
        let colors = [UIColor.baseGradientStartWithAlpha15, UIColor.baseGradientEndWithAlpha15]
        let location = [0.0, 1.0]
        
        contentView.addGradient(with: gradientLayer, colorSet: colors, locations: location)
        gradientLayer.zPosition = -1
    }

}

// MARK: - Extension

extension PlayerBetViewCell {
    
    private func configureCell() {
        contentView.layer.cornerRadius = 5
        contentView.layer.masksToBounds = true
        configureSubviews()
        configureConstraints()
    }
    
    private func configureSubviews() {
        contentView.addSubview(backView)
        backView.addSubview(avatarImage)
        backView.addSubview(priceView)
        priceView.addSubview(priceStackView)
        backView.addSubview(weaponImage1)
        backView.addSubview(weaponImage2)
        backView.addSubview(weaponImage3)
        backView.addSubview(inGameView)
        inGameView.addSubview(inGameLabel)
    }
    
    private func configureConstraints() {
        NSLayoutConstraint.activate([
        
            backView.topAnchor.constraint(equalTo: contentView.topAnchor),
            backView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            backView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            backView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            avatarImage.topAnchor.constraint(equalTo: backView.topAnchor, constant: 5),
            avatarImage.leadingAnchor.constraint(equalTo: backView.leadingAnchor, constant: 5),
            avatarImage.bottomAnchor.constraint(equalTo: backView.bottomAnchor, constant: -5),
            avatarImage.widthAnchor.constraint(equalTo: avatarImage.heightAnchor),

            priceView.topAnchor.constraint(equalTo: backView.topAnchor, constant: 5),
            priceView.leadingAnchor.constraint(equalTo: avatarImage.trailingAnchor, constant: 5),
            priceView.bottomAnchor.constraint(equalTo: backView.bottomAnchor, constant: -5),
            priceView.widthAnchor.constraint(equalToConstant: 70),
            
            priceStackView.centerXAnchor.constraint(equalTo: priceView.centerXAnchor),
            priceStackView.centerYAnchor.constraint(equalTo: priceView.centerYAnchor),

            goldIcon.widthAnchor.constraint(equalToConstant: 8),
            goldIcon.heightAnchor.constraint(equalToConstant: 8),

            weaponImage1.topAnchor.constraint(equalTo: backView.topAnchor, constant: 5),
            weaponImage1.leadingAnchor.constraint(equalTo: priceView.trailingAnchor, constant: 5),
            weaponImage1.bottomAnchor.constraint(equalTo: backView.bottomAnchor, constant: -5),
            weaponImage1.widthAnchor.constraint(equalToConstant: 50),
            
            weaponImage2.topAnchor.constraint(equalTo: backView.topAnchor, constant: 5),
            weaponImage2.leadingAnchor.constraint(equalTo: weaponImage1.trailingAnchor, constant: 5),
            weaponImage2.bottomAnchor.constraint(equalTo: backView.bottomAnchor, constant: -5),
            weaponImage2.widthAnchor.constraint(equalToConstant: 50),
            
            weaponImage3.topAnchor.constraint(equalTo: backView.topAnchor, constant: 5),
            weaponImage3.leadingAnchor.constraint(equalTo: weaponImage2.trailingAnchor, constant: 5),
            weaponImage3.bottomAnchor.constraint(equalTo: backView.bottomAnchor, constant: -5),
            weaponImage3.widthAnchor.constraint(equalToConstant: 50),
            
            inGameView.topAnchor.constraint(equalTo: backView.topAnchor, constant: 5),
            inGameView.trailingAnchor.constraint(equalTo: backView.trailingAnchor, constant: -5),
            inGameView.bottomAnchor.constraint(equalTo: backView.bottomAnchor, constant: -5),
            inGameView.widthAnchor.constraint(equalToConstant: 60),

            inGameLabel.centerYAnchor.constraint(equalTo: inGameView.centerYAnchor),
            inGameLabel.centerXAnchor.constraint(equalTo: inGameView.centerXAnchor),
        ])
    }
}

