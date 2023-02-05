//
//  WeaponViewController.swift
//  Standoff-Case
//
//  Created by Andrey on 28.01.2023.
//

import UIKit

class WeaponViewController: ContainerViewController, WeaponNavigationBarViewDelegate {
    
    // MARK: - Properties

    private lazy var weaponNavBar = WeaponNavigationBarView().forAutoLayout()
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        weaponNavBar.delegate = self
        setupVC()
        configureSubviews()
    }
    
    func didSelect(index: Int) {
        self.changeSelectedViewController(at: index)
    }
}

// MARK: - Extension

extension WeaponViewController {
    private func setupVC() {
        let invent = InventoryViewController()
        let shop = ShopViewController()
        let market = MarketViewController()
        self.setViewControllers([invent, shop, market])
    }
    
    private func configureSubviews() {
        self.contentStackView.addArrangedSubview(weaponNavBar)
        configureConstraints()
    }
    
    private func configureConstraints() {
        weaponNavBar.heightAnchor.constraint(equalToConstant: 40).activated()
    }
}
