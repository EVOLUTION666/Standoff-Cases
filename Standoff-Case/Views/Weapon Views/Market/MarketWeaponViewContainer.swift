//
//  MarketWeaponViewContainer.swift
//  Standoff-Case
//
//  Created by Andrey on 08.02.2023.
//

import UIKit

class MarketWeaponViewContainer: UIView, UICollectionViewDelegate {
    
    // MARK: - Properties
    
    private lazy var backView: UIView = {
       let backView = UIView()
        backView.translatesAutoresizingMaskIntoConstraints = false
        backView.backgroundColor = .clear
        return backView
    }()
    
    private(set) lazy var collectionMarketView: UICollectionView = {
        let viewLayout = UICollectionViewFlowLayout()
        let collectionMarketView = UICollectionView(frame: .zero, collectionViewLayout: viewLayout)
        collectionMarketView.translatesAutoresizingMaskIntoConstraints = false
        collectionMarketView.backgroundColor = .clear
        collectionMarketView.showsVerticalScrollIndicator = false
        collectionMarketView.register(MarketCollectionViewCell.self, forCellWithReuseIdentifier: "marketCell")
        collectionMarketView.delegate = self
        collectionMarketView.dataSource = self
        return collectionMarketView
    }()
    
    // MARK: - Life cycle

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureView()
    }

}

// MARK: - Extension

extension MarketWeaponViewContainer {
    
    private func configureView() {
        backgroundColor = .blackWith50Alpha
        configureSubviews()
        setupConstraints()
    }
    
    private func configureSubviews() {
        addSubview(backView)
        backView.addSubview(collectionMarketView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            
            backView.topAnchor.constraint(equalTo: self.topAnchor),
            backView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            backView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            backView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            collectionMarketView.topAnchor.constraint(equalTo: backView.topAnchor, constant: 5),
            collectionMarketView.leadingAnchor.constraint(equalTo: backView.leadingAnchor, constant: 5),
            collectionMarketView.trailingAnchor.constraint(equalTo: backView.trailingAnchor, constant: -5),
            collectionMarketView.bottomAnchor.constraint(equalTo: backView.bottomAnchor, constant: -5),
            
        ])
    }
}

extension MarketWeaponViewContainer: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 30
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "marketCell", for: indexPath) as! MarketCollectionViewCell
        cell.contentView.backgroundColor = .gray2With30Alpha
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let widthCell = (collectionView.frame.width - 15) / 4
        return .init(width: widthCell, height: widthCell * 0.79)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
}

