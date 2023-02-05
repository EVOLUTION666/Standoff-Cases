//
//  ShopViewController.swift
//  Standoff-Case
//
//  Created by Andrey on 01.02.2023.
//

import UIKit

class ShopViewController: UIViewController {
    
    // MARK: - Properties
    
    override var prefersHomeIndicatorAutoHidden: Bool {
        return true
    }
    
    override var preferredScreenEdgesDeferringSystemGestures: UIRectEdge {
        return [.bottom]
    }
    
    private lazy var shopNavBar = ShopNavBarView().forAutoLayout()
    
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
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setNeedsUpdateOfHomeIndicatorAutoHidden()
        setNeedsUpdateOfScreenEdgesDeferringSystemGestures()
    }
    
}

extension ShopViewController {
    private func configureUI() {
        configureSubviews()
        configureConstraints()
    }
    
    private func configureSubviews() {
        view.addSubview(shopNavBar)
        view.addSubview(shopContrainerView)
    }
    
    private func configureConstraints() {
        NSLayoutConstraint.activate([
        
            shopNavBar.topAnchor.constraint(equalTo: view.topAnchor),
            shopNavBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            shopNavBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            shopContrainerView.topAnchor.constraint(equalTo: shopNavBar.bottomAnchor),
            shopContrainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            shopContrainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            shopContrainerView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            
        ])
    }
}
