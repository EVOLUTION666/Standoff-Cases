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
        view.backgroundColor = .blackWith35Alpha
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
            inventoryContainerView.topAnchor.constraint(equalTo: view.topAnchor, constant: 5),
            inventoryContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5),
            inventoryContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5),
            inventoryContainerView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -5),
        ])
    }
}

extension InventoryViewController: CustomAlertViewDelegate {
    func previewButtonMethodDelegate() {
        print("str")
    }

}
