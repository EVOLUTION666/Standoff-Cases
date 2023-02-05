//
//  ShopContainerView.swift
//  Standoff-Case
//
//  Created by Andrey on 02.02.2023.
//

import UIKit

class ShopContainerView: UIView, UICollectionViewDelegate {
    
    // MARK: - Properties
    
    private(set) lazy var caseCollectionView: UICollectionView = {
        let viewLayout = UICollectionViewFlowLayout()
        viewLayout.scrollDirection = .horizontal
        let caseCollectionView = UICollectionView(frame: .zero, collectionViewLayout: viewLayout)
        caseCollectionView.translatesAutoresizingMaskIntoConstraints = false
        caseCollectionView.backgroundColor = .clear
        caseCollectionView.showsHorizontalScrollIndicator = false
        caseCollectionView.register(ShopCollectionViewCell.self, forCellWithReuseIdentifier: "caseCell")
        caseCollectionView.delegate = self
        caseCollectionView.dataSource = self
        return caseCollectionView
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

extension ShopContainerView {
    
    private func configureView() {
        configureSubviews()
        configureConstraints()
    }
    
    private func configureSubviews() {
        addSubview(caseCollectionView)
    }
    
    private func configureConstraints() {
        NSLayoutConstraint.activate([
            
            caseCollectionView.topAnchor.constraint(equalTo: self.topAnchor),
            caseCollectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            caseCollectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            caseCollectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
        ])
    }
    
}

extension ShopContainerView: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "caseCell", for: indexPath) as! ShopCollectionViewCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height: CGFloat = (collectionView.frame.height - 7) / 2
        let height2: CGFloat = (collectionView.frame.height * 0.55)
        let height3: CGFloat = (collectionView.frame.height - height2 - 7)
        return indexPath.item % 2 == 0 ? .init(width: height * 0.81, height: height2) : .init(width: height * 0.81, height: height3)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath)
    }
    
}
