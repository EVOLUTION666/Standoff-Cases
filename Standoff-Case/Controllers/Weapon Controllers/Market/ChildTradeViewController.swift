//
//  ChildTradeViewController.swift
//  Standoff-Case
//
//  Created by Andrey on 07.02.2023.
//

import UIKit

class ChildTradeViewController: UIViewController {
    
    // MARK: - Properties
    
    private lazy var backView: UIView = {
       let backView = UIView()
        backView.backgroundColor = .clear
        backView.translatesAutoresizingMaskIntoConstraints = false
        return backView
    }()
    
    private lazy var tradingSortFilterView: TradingSortFilterView = {
        let tradingSortFilterView = TradingSortFilterView()
        tradingSortFilterView.translatesAutoresizingMaskIntoConstraints = false
        return tradingSortFilterView
    }()
    
    private lazy var marketWeaponViewContainer: MarketWeaponViewContainer = {
        let marketWeaponViewContainer = MarketWeaponViewContainer()
        marketWeaponViewContainer.translatesAutoresizingMaskIntoConstraints = false
        return marketWeaponViewContainer
    }()
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
}

// MARK: - Extension

extension ChildTradeViewController {
    
    private func configureUI() {
        view.backgroundColor = .white
        configureSubviews()
        configureConstraints()
    }
    
    private func configureSubviews() {
        view.addSubview(backView)
        backView.addSubview(tradingSortFilterView)
        backView.addSubview(marketWeaponViewContainer)
    }
    
    private func configureConstraints() {
        NSLayoutConstraint.activate([
            
            backView.topAnchor.constraint(equalTo: view.topAnchor, constant: 5),
            backView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5),
            backView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant:  -5),
            backView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant:  -5),
        
            tradingSortFilterView.topAnchor.constraint(equalTo: backView.topAnchor),
            tradingSortFilterView.leadingAnchor.constraint(equalTo: backView.leadingAnchor),
            tradingSortFilterView.bottomAnchor.constraint(equalTo: backView.bottomAnchor),
            tradingSortFilterView.widthAnchor.constraint(equalToConstant: 166),
            
            marketWeaponViewContainer.topAnchor.constraint(equalTo: backView.topAnchor),
            marketWeaponViewContainer.leadingAnchor.constraint(equalTo: tradingSortFilterView.trailingAnchor, constant: 5),
            marketWeaponViewContainer.trailingAnchor.constraint(equalTo: backView.trailingAnchor),
            marketWeaponViewContainer.bottomAnchor.constraint(equalTo: backView.bottomAnchor),
            
        ])
    }
    
}
