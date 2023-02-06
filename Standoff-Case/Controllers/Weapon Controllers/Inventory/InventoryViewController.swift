//
//  InventoryViewController.swift
//  Standoff-Case
//
//  Created by Andrey on 01.02.2023.
//

import UIKit

class InventoryViewController: UIViewController {
    
    //MARK: - Properties
    
    private lazy var inventoryContainerView: InventoryContainerView = {
        let inventoryContainerView = InventoryContainerView()
        inventoryContainerView.translatesAutoresizingMaskIntoConstraints = false
        return inventoryContainerView
    }()

    //MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
}

//MARK: - Extension

extension InventoryViewController {
    
    private func configureUI() {
        configureSubviews()
        configureConstraints()
    }
    
    private func configureSubviews() {
        view.addSubview(inventoryContainerView)
    }
    
    private func configureConstraints() {
        NSLayoutConstraint.activate([
            inventoryContainerView.topAnchor.constraint(equalTo: view.topAnchor),
            inventoryContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            inventoryContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            inventoryContainerView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
}
