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

class ProfileViewController: UIViewController {
    private lazy var profileView: UIView = {
        let view = UIView().forAutoLayout()
        view.backgroundColor = .green
        view.setSize(height: UIScreen.main.bounds.size.height * 0.36)
        return view
    }()
    
    private lazy var avatarImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView.forAutoLayout()
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        return label.forAutoLayout()
    }()
    
    private lazy var stausLabel: UILabel = {
        let label = UILabel()
        return label.forAutoLayout()
    }()
    
    private lazy var progressBackgroundView: UIView = {
        let view = UIView().forAutoLayout()
        view.backgroundColor = .magenta
        return view
    }()
    
    private lazy var ranksCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout).forAutoLayout()
        collectionView.setSize(height: UIScreen.main.bounds.size.height * 0.55)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(ProfileRankCollectionCell.self, forCellWithReuseIdentifier: "ProfileRankCollectionCell")
        collectionView.backgroundColor = .red
        return collectionView
    }()
    
    private var ranks: [ProfileRankCollectionCell.DisplayItem] = [.init(title: "Hello", image: .init(named: "rank1")!), .init(title: "Hello", image: .init(named: "rank1")!), .init(title: "Hello", image: .init(named: "rank1")!), .init(title: "Hello", image: .init(named: "rank1")!)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
        view.addSubview(profileView)
        view.addSubview(progressBackgroundView)
        view.addSubview(ranksCollectionView)
        
        NSLayoutConstraint.activate([
            profileView.topAnchor.constraint(equalTo: view.topAnchor),
            profileView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            profileView.bottomAnchor.constraint(equalTo: progressBackgroundView.topAnchor),
            profileView.widthAnchor.constraint(equalToConstant: 310),
            
            progressBackgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            progressBackgroundView.widthAnchor.constraint(equalTo: profileView.widthAnchor),
            
            ranksCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            ranksCollectionView.topAnchor.constraint(equalTo: progressBackgroundView.bottomAnchor),
            ranksCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            ranksCollectionView.widthAnchor.constraint(equalTo: profileView.widthAnchor),
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
        .init(width: 148, height: 96)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 4
    }
}
