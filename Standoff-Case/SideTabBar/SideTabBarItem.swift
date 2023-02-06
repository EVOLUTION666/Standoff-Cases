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
        let selectedTitleColor: UIColor
        let selectedBackgroundColor: UIColor
        let backgroundColor: UIColor
    }
    
    override var isSelected: Bool {
        didSet {
            if isSelected {
                self.backgroundColor = self.style.selectedBackgroundColor
            } else {
                self.backgroundColor = self.style.backgroundColor
            }
        }
    }
    
    private var style = Style(font: .systemFont(ofSize: 15),
                              titleColor: .white,
                              selectedTitleColor: .white,
                              selectedBackgroundColor: .blackWith50Alpha,
                              backgroundColor: .blackWith70Alpha)
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.setSize(width: 25, height: 25)
        imageView.isUserInteractionEnabled = false
        return imageView.forAutoLayout()
    }()
    
    private lazy var titleLabel: UILabel = {
        let lbl = UILabel().forAutoLayout()
        lbl.isUserInteractionEnabled = false
        return lbl
    }()
    
    private lazy var contentStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [imageView, titleLabel]).forAutoLayout()
        stack.axis = .horizontal
        stack.distribution = .fill
        stack.alignment = .center
        stack.isUserInteractionEnabled = false
        return stack
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(contentStackView)
        self.isUserInteractionEnabled = true
        NSLayoutConstraint.activate([
            contentStackView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            contentStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16)
        ])
        self.backgroundColor = style.backgroundColor
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
        self.style = style
        self.backgroundColor = isSelected ? style.selectedBackgroundColor : style.backgroundColor
        self.titleLabel.textColor = isSelected ? style.selectedTitleColor : style.titleColor
        self.titleLabel.font = style.font
    }
    
}
