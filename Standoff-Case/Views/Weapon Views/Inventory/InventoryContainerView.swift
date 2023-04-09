//
//  InventoryContainerView.swift
//  Standoff-Case
//
//  Created by Andrey on 29.01.2023.
//

import UIKit

class InventoryContainerView: UIView, UICollectionViewDelegate {
    
    // MARK: - Properties
    
    var menuView: InventoryAlertView?
    var selectedIndexPath: IndexPath?
    
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
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        guard let cell = collectionView.cellForItem(at: indexPath) else {
            return
        }
        
        // Remove previous menu view if it exists
        menuView?.removeFromSuperview()
        
        if (indexPath == selectedIndexPath) {
            // Deselect cell and clear selection state
            collectionView.deselectItem(at: indexPath, animated: true)
            selectedIndexPath = nil
        } else {
            // Calculate menu view position
            let menuWidth: CGFloat = 100
            let menuHeight: CGFloat = 40
            let cellFrame = collectionView.convert(cell.frame, to: collectionView.superview)
            let menuX = cellFrame.maxX - (cellFrame.width / 2)
            let menuY = cellFrame.midY - menuHeight / 2
            let menuFrame = CGRect(x: menuX, y: menuY, width: menuWidth, height: menuHeight)
            
            // Create and show menu view
            let menuView = InventoryAlertView(frame: menuFrame)
            collectionView.superview?.addSubview(menuView)
            self.menuView = menuView
            
            // Update selection state
            selectedIndexPath = indexPath
        }
        menuView?.delegate = self
    }
}

extension InventoryContainerView: CustomAlertViewDelegate {
    func previewButtonMethodDelegate() {
        print("Hello world")
        let emptyVC = UINavigationController(rootViewController: Presenter3DTableViewController())
        self.window?.rootViewController?.present(emptyVC, animated: true)
    }
}
