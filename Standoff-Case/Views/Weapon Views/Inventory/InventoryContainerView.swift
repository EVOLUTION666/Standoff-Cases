//
//  InventoryContainerView.swift
//  Standoff-Case
//
//  Created by Andrey on 29.01.2023.
//

import UIKit

class InventoryContainerView: UIView, UICollectionViewDelegate {
    
    // MARK: - Properties
    
    private lazy var inventoryBackView: UIView = {
        let inventoryBackView = UIView()
        inventoryBackView.translatesAutoresizingMaskIntoConstraints = false
        inventoryBackView.backgroundColor = .blackWith50Alpha
        return inventoryBackView
    }()
    
    private(set) lazy var collectionInventoryView: UICollectionView = {
        let viewLayout = UICollectionViewFlowLayout()
        let collectionInventoryView = UICollectionView(frame: .zero, collectionViewLayout: viewLayout)
        collectionInventoryView.translatesAutoresizingMaskIntoConstraints = false
        collectionInventoryView.backgroundColor = .clear
        collectionInventoryView.showsVerticalScrollIndicator = false
        collectionInventoryView.register(InventoryCollectionViewCell.self, forCellWithReuseIdentifier: "inventoryCell")
        collectionInventoryView.delegate = self
        collectionInventoryView.dataSource = self
        return collectionInventoryView
    }()
    
    // MARK: - Life cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureView()
    }
    
}

// MARK: - Extension

extension InventoryContainerView {
    
    private func configureView() {
        configureSubviews()
        configureConstraints()
    }
    
    private func configureSubviews() {
        addSubview(inventoryBackView)
        inventoryBackView.addSubview(collectionInventoryView)
    }
    
    private func configureConstraints() {
        NSLayoutConstraint.activate([
            inventoryBackView.topAnchor.constraint(equalTo: self.topAnchor),
            inventoryBackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            inventoryBackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            inventoryBackView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            collectionInventoryView.topAnchor.constraint(equalTo: inventoryBackView.topAnchor, constant: 5),
            collectionInventoryView.leadingAnchor.constraint(equalTo: inventoryBackView.leadingAnchor, constant: 5),
            collectionInventoryView.trailingAnchor.constraint(equalTo: inventoryBackView.trailingAnchor, constant: -5),
            collectionInventoryView.bottomAnchor.constraint(equalTo: inventoryBackView.bottomAnchor, constant: -5),
        ])
    }
}

extension InventoryContainerView: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 50
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "inventoryCell", for: indexPath) as! InventoryCollectionViewCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: (collectionView.frame.width - 20) / 5, height: (collectionView.frame.width - 8) / 5 * 0.66)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
}
