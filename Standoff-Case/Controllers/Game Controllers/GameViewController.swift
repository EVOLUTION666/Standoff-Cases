//
//  GameViewController.swift
//  Standoff-Case
//
//  Created by Andrey on 28.01.2023.
//

import UIKit

class GameViewController: BaseViewController {
    
    // MARK: - Properties
    
    private lazy var topStackView: UIStackView = {
       let topStackView = UIStackView()
        topStackView.translatesAutoresizingMaskIntoConstraints = false
        topStackView.distribution = .fillEqually
        topStackView.axis = .horizontal
        return topStackView
    }()

    private lazy var chartView: ChartView  = {
       let chartView = ChartView()
        chartView.backgroundColor = .blackWith35Alpha
        chartView.translatesAutoresizingMaskIntoConstraints = false
        return chartView
    }()

    private lazy var selectionView: SelectionView  = {
       let selectionView = SelectionView()
        selectionView.backgroundColor = .blackWith35Alpha
        selectionView.translatesAutoresizingMaskIntoConstraints = false
        return selectionView
    }()

    private lazy var coeffCarouselView: CoefficientCarouselView = {
       let coeffCarouselView = CoefficientCarouselView()
        coeffCarouselView.translatesAutoresizingMaskIntoConstraints = false
        coeffCarouselView.backgroundColor = .blackWith35Alpha
        coeffCarouselView.layer.cornerRadius = 5
        coeffCarouselView.layer.masksToBounds = true
        return coeffCarouselView
    }()

    private lazy var playerBetsView: PlayerBetsView = {
       let playerBetsView = PlayerBetsView()
        playerBetsView.translatesAutoresizingMaskIntoConstraints = false
        return playerBetsView
    }()
    
    // MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blackWith35Alpha
        configureUI()
    }

}

// MARK: - Extension

extension GameViewController {
    
    private func configureUI() {
        configureSubviews()
        configureConstraints()
    }

    private func configureSubviews() {
        view.addSubview(topStackView)
        topStackView.addArrangedSubview(chartView)
        topStackView.addArrangedSubview(selectionView)
        view.addSubview(coeffCarouselView)
        view.addSubview(playerBetsView)
    }

    private func configureConstraints() {

        let controllerViewHeight = view.frame.size.height

        NSLayoutConstraint.activate([

            topStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 5),
            topStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5),
            topStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5),
            topStackView.heightAnchor.constraint(equalToConstant: controllerViewHeight / 2),

            coeffCarouselView.topAnchor.constraint(equalTo: topStackView.bottomAnchor, constant: 5),
            coeffCarouselView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5),
            coeffCarouselView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5),
            coeffCarouselView.heightAnchor.constraint(equalToConstant: 30),

            playerBetsView.topAnchor.constraint(equalTo: coeffCarouselView.bottomAnchor, constant: 5),
            playerBetsView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5),
            playerBetsView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5),
            playerBetsView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -5),

        ])
    }
}

