//
//  ProfileRankCollectionCell.swift
//  Standoff-Case
//
//  Created by Astemir Shibzuhov on 1/29/23.
//

import UIKit

class ProfileRankCollectionCell: UICollectionViewCell {
    struct DisplayItem {
        let title: String
        let image: UIImage
    }
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView().forAutoLayout()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var titleView: UIView = {
        let view = UIView().forAutoLayout()
        view.setSize(height: 17)
        return view
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel().forAutoLayout()
        label.textColor = .black
        label.font = .oswald(size: 15)
        label.textColor = .textPrimary
        label.textAlignment = .center
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.titleView.addSubview(titleLabel)
        self.titleLabel.setSimpleConstraints()
        self.contentView.addSubview(titleView)
        self.contentView.addSubview(imageView)
        self.backgroundColor = .blackWith20Alpha
        self.layer.borderColor = UIColor.black.withAlphaComponent(0.1).cgColor
        self.layer.borderWidth = 1
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 4),
            imageView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 4),
            imageView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -4),
            imageView.bottomAnchor.constraint(equalTo: self.titleView.topAnchor, constant: -4),
            
            titleView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -4),
            titleView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 4),
            titleView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -4),
        ])
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setDisplayItem(_ item: DisplayItem) {
        self.titleLabel.text = item.title
        self.imageView.image = item.image
    }
}
