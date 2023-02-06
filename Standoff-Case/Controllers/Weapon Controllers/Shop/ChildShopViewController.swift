//
//  ShopViewController.swift
//  Standoff-Case
//
//  Created by Andrey on 01.02.2023.
//

import UIKit

class ChildShopViewController: UIViewController {
    
    // MARK: - Properties
    
    private lazy var shopContrainerView: ShopContainerView = {
        let shopContrainerView = ShopContainerView()
        shopContrainerView.translatesAutoresizingMaskIntoConstraints = false
        return shopContrainerView
    }()
    
    private lazy var backView: UIView = {
        let backView = UIView()
        return backView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .clear
        configureUI()
    }
    
}

extension ChildShopViewController {
    
    private func configureUI() {
        configureSubviews()
        configureConstraints()
    }
    
    private func configureSubviews() {
        view.addSubview(shopContrainerView)
    }
    
    private func configureConstraints() {
        NSLayoutConstraint.activate([
            
            shopContrainerView.topAnchor.constraint(equalTo: view.topAnchor),
            shopContrainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            shopContrainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            shopContrainerView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
        ])
    }
}
