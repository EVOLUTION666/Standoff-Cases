//
//  SideTabBar.swift
//  Standoff-Case
//
//  Created by Astemir Shibzuhov on 1/28/23.
//

import UIKit

protocol SideTabBarDelegate: AnyObject {
    func didSelect(index: Int)
}
class SideTabBar: UIView {
    enum SideTabBarAxis {
        case horizontal, vertical
    }
    
    var axis: SideTabBarAxis = .vertical {
        didSet {
            self.updateAxis()
        }
    }
    
    weak var sideTabBarDelegate: SideTabBarDelegate?
    
    private(set) var selectedItem = 0
    private var items = [SideTabBarItem.DisplayItem]()
    
    private lazy var itemsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.alignment = .center
        return stackView.forAutoLayout()
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(self.itemsStackView)
        NSLayoutConstraint.activate([
            itemsStackView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            itemsStackView.topAnchor.constraint(equalTo: self.topAnchor),
            itemsStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            itemsStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
        ])
        backgroundColor = .blue
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setItems(_ items: [SideTabBarItem.DisplayItem]) {
        self.items.removeAll()
        self.itemsStackView.arrangedSubviews.forEach({ $0.removeFromSuperview() })
        self.selectedItem = 0
        self.items = items
        items.enumerated().forEach({
            let item = SideTabBarItem()
            item.addTarget(self, action: #selector(didSelect), for: .touchUpInside)
            item.setDisplayItem($0.element)
            item.tag = $0.offset
            if $0.offset == self.selectedItem {
                item.isSelected = true
            }
            itemsStackView.insertArrangedSubview(item, at: $0.offset)
            item.widthAnchor.constraint(equalTo: itemsStackView.widthAnchor).isActive = true
        })
    }
    
    private func updateAxis() {
        itemsStackView.axis = self.axis == .vertical ? .vertical : .horizontal
        self.layoutIfNeeded()
    }
    
    @objc
    private func didSelect(_ sender: SideTabBarItem ) {
        self.selectedItem = sender.tag
        self.itemsStackView.arrangedSubviews.forEach({ ($0 as? SideTabBarItem)?.isSelected = false })
        sender.isSelected.toggle()
        self.sideTabBarDelegate?.didSelect(index: sender.tag)
    }
}
