//
//  ProfileView.swift
//  Standoff-Case
//
//  Created by Astemir Shibzuhov on 2/6/23.
//

import UIKit

class ProfileView: UIView {
    private lazy var avatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.setSize(size: .init(width: 80, height: 80))
        imageView.image = .init(named: "avatarPlaceholder")
        return imageView.forAutoLayout()
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = .oswald(size: 17, weight: .medium)
        label.textColor = .textPrimary
        label.text = "Name"
        return label.forAutoLayout()
    }()
    
    private lazy var stausLabel: UILabel = {
        let label = UILabel()
        label.font = .oswald(size: 15)
        label.textColor = .textPrimary
        label.text = "Loop lo"
        return label.forAutoLayout()
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .blackWith50Alpha
        addSubview(nameLabel)
        addSubview(stausLabel)
        addSubview(avatarImageView)
        
        NSLayoutConstraint.activate([
            avatarImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            avatarImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
            
            nameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 12),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            nameLabel.topAnchor.constraint(equalTo: avatarImageView.topAnchor, constant: 4),
            
            stausLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 12),
            stausLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            stausLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 4),
        ])
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
