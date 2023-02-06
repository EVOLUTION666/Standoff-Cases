//
//  ProfileViewController.swift
//  Standoff-Case
//
//  Created by Astemir Shibzuhov on 1/28/23.
//

import UIKit

struct RankModel {
    let title: String
    let image: UIImage
}

class ProfileViewController: BaseViewController {
    private lazy var profileView: ProfileView = {
        let view = ProfileView().forAutoLayout()
        view.setSize(height: UIScreen.main.bounds.size.height * 0.33)
        return view
    }()
    
    private lazy var progressView: ProfileProgressView = {
        let view = ProfileProgressView().forAutoLayout()
        return view
    }()
    
    private lazy var ranksBackgroundView: UIView = {
        let view = UIView().forAutoLayout()
        view.backgroundColor = .blackWith50Alpha
        return view
    }()
    
    private lazy var ranksCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout).forAutoLayout()
        collectionView.setSize(height: UIScreen.main.bounds.size.height * 0.53)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.showsVerticalScrollIndicator = false
        collectionView.register(ProfileRankCollectionCell.self, forCellWithReuseIdentifier: "ProfileRankCollectionCell")
        collectionView.backgroundColor = .clear
        collectionView.alwaysBounceVertical = true
        return collectionView
    }()
    
    private var ranks: [ProfileRankCollectionCell.DisplayItem] = [.init(title: "Hello", image: .init(named: "rank1")!), .init(title: "Hello", image: .init(named: "rank1")!), .init(title: "Hello", image: .init(named: "rank1")!), .init(title: "Hello", image: .init(named: "rank1")!)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .clear
        view.addSubview(profileView)
        view.addSubview(progressView)
        view.addSubview(ranksBackgroundView)
        ranksBackgroundView.addSubview(ranksCollectionView)
        
        NSLayoutConstraint.activate([
            profileView.topAnchor.constraint(equalTo: view.topAnchor),
            profileView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 4),
            profileView.bottomAnchor.constraint(equalTo: progressView.topAnchor, constant: -2),
            profileView.widthAnchor.constraint(equalToConstant: 310),
            
            progressView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 4),
            progressView.widthAnchor.constraint(equalTo: profileView.widthAnchor),
            
            ranksBackgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            ranksBackgroundView.topAnchor.constraint(equalTo: progressView.bottomAnchor, constant: 2),
            ranksBackgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 4),
            ranksBackgroundView.widthAnchor.constraint(equalTo: profileView.widthAnchor),
            
            ranksCollectionView.bottomAnchor.constraint(equalTo: ranksBackgroundView.bottomAnchor, constant: -6),
            ranksCollectionView.topAnchor.constraint(equalTo: ranksBackgroundView.topAnchor, constant: 6),
            ranksCollectionView.leadingAnchor.constraint(equalTo: ranksBackgroundView.leadingAnchor, constant: 6),
            ranksCollectionView.trailingAnchor.constraint(equalTo: ranksBackgroundView.trailingAnchor, constant: -6),
        ])
    }
}

// MARK: CollectionView
extension ProfileViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.ranks.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProfileRankCollectionCell", for: indexPath) as! ProfileRankCollectionCell
        cell.setDisplayItem(ranks[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: (collectionView.frame.width / 2) - 3, height: 96)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 6
    }
}
