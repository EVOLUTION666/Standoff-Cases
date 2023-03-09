//
//  PlayerBetsView.swift
//  Standoff-Case
//
//  Created by Andrey on 04.03.2023.
//

import UIKit

class PlayerBetsView: UIView {
    
    // MARK: - Properties
    
    private lazy var betsTableView: UITableView = {
       let betsTableView = UITableView()
        betsTableView.translatesAutoresizingMaskIntoConstraints = false
        betsTableView.backgroundColor = .blackWith35Alpha
        betsTableView.layer.cornerRadius = 5
        betsTableView.layer.masksToBounds = true
        betsTableView.separatorStyle = .none
        betsTableView.showsVerticalScrollIndicator = false
        betsTableView.delegate = self
        betsTableView.dataSource = self
        betsTableView.register(PlayerBetViewCell.self, forCellReuseIdentifier: PlayerBetViewCell.identifier)
        return betsTableView
    }()
    
    // MARK: - Life Cycle

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureView()
    }

}

extension PlayerBetsView {
    
    private func configureView() {
        configureSubviews()
        configureConstraints()
    }
    
    private func configureSubviews() {
        addSubview(betsTableView)
    }
    
    private func configureConstraints() {
        NSLayoutConstraint.activate([
        
            betsTableView.topAnchor.constraint(equalTo: topAnchor),
            betsTableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            betsTableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            betsTableView.bottomAnchor.constraint(equalTo: bottomAnchor),
        
        ])
    }
}

extension PlayerBetsView: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PlayerBetViewCell.identifier, for: indexPath) as! PlayerBetViewCell
        cell.selectionStyle = .none
        cell.backgroundColor = .clear
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 45
    }
    
}

