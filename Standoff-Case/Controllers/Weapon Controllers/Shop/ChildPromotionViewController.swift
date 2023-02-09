//
//  PromotionViewController.swift
//  Standoff-Case
//
//  Created by Andrey on 06.02.2023.
//

import UIKit

class ChildPromotionViewController: UIViewController {
    
    // MARK: - Properties
    
    private lazy var promotionContainerView: PromotionContainerView = {
       let promotionContainerView = PromotionContainerView()
        promotionContainerView.translatesAutoresizingMaskIntoConstraints = false
        return promotionContainerView
    }()

    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .clear
        configureUI()
    }

}

extension ChildPromotionViewController {
    
    private func configureUI() {
        configureSubviews()
        configureConstraints()
    }
    
    private func configureSubviews() {
        view.addSubview(promotionContainerView)
    }
    
    private func configureConstraints() {
        NSLayoutConstraint.activate([
        
            promotionContainerView.topAnchor.constraint(equalTo: view.topAnchor),
            promotionContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            promotionContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            promotionContainerView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
        ])
    }
}
