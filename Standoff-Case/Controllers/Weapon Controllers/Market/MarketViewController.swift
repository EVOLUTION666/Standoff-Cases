//
//  MarketViewController.swift
//  Standoff-Case
//
//  Created by Andrey on 01.02.2023.
//

import UIKit

class MarketViewController: ContainerViewController, MarketNavBarViewDelegate {
    
    // MARK: - Properties
    
    private lazy var marketNavBar = MarketNavBarView().forAutoLayout()
    
    // MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        marketNavBar.delegate = self
        setupVC()
        configureUI()
    }
    
    func didSelect(index: Int) {
        self.changeSelectedViewController(at: index)
    }

}

extension MarketViewController {
    
    private func setupVC() {
        let trade = ChildTradeViewController()
        let history = ChildHistoryViewController()
        self.setViewControllers([trade, history])
    }
    
    private func configureUI() {
        configureSubviews()
        configureConstraints()
    }
    
    private func configureSubviews() {
        self.contentStackView.addArrangedSubview(marketNavBar)
    }
    
    private func configureConstraints() {
        NSLayoutConstraint.activate([
        
            marketNavBar.topAnchor.constraint(equalTo: view.topAnchor),
            marketNavBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            marketNavBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
        ])
    }
    
}
