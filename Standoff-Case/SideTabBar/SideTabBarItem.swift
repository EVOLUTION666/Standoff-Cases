//
//  SideTabBarItem.swift
//  Standoff-Case
//
//  Created by Astemir Shibzuhov on 1/28/23.
//

import UIKit

class SideTabBarItem: UIControl {
    struct DisplayItem {
        let title: String?
        let image: UIImage?
    }
    
    struct Style {
        let font: UIFont
        let titleColor: UIColor
    }
    
    override var isSelected: Bool {
        didSet {
            if isSelected {
                self.backgroundColor = .green
            } else {
                self.backgroundColor = .red
            }
        }
    }
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.setSize(width: 25, height: 25)
        return imageView.forAutoLayout()
    }()
    
    private lazy var titleLabel: UILabel = {
        let lbl = UILabel().forAutoLayout()
        return lbl
    }()
    
    private lazy var contentStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [imageView, titleLabel]).forAutoLayout()
        stack.axis = .horizontal
        stack.distribution = .fill
        stack.alignment = .center
        return stack
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(contentStackView)
        self.isUserInteractionEnabled = true
        NSLayoutConstraint.activate([
            contentStackView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            contentStackView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
        ])
        self.backgroundColor = .red
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setDisplayItem(_ item: DisplayItem) {
        self.imageView.image = item.image
        self.titleLabel.text = item.title
        self.titleLabel.isHidden = item.title == nil
        self.imageView.isHidden = item.image == nil
    }
    
    func setStyle(_ style: Style) {
        self.titleLabel.font = style.font
        self.titleLabel.textColor = style.titleColor
    }
    
}
