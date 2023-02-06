//
//  ShopViewController.swift
//  Standoff-Case
//
//  Created by Andrey on 06.02.2023.
//

import UIKit

class ShopViewController: ContainerViewController, ShopNavBarViewDelegate {
    
    // MARK: - Properties
        
    private lazy var shopNavBar = ShopNavBarView().forAutoLayout()

    override func viewDidLoad() {
        super.viewDidLoad()
        shopNavBar.delegate = self
        setupVC()
        configureUI()
    }
    
    func didSelect(index: Int) {
        self.changeSelectedViewController(at: index)
    }
}

// MARK: - Extension

extension ShopViewController {
    
    private func setupVC() {
        let shop = ChildShopViewController()
        let promotion = ChildPromotionViewController()
        self.setViewControllers([shop, promotion])
    }
    
    private func configureUI() {
        configureSubviews()
        configureConstraints()
    }
    
    private func configureSubviews() {
        self.contentStackView.addArrangedSubview(shopNavBar)
    }
    
    private func configureConstraints() {
        NSLayoutConstraint.activate([
        
            shopNavBar.topAnchor.constraint(equalTo: view.topAnchor),
            shopNavBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            shopNavBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
        ])
    }
}
