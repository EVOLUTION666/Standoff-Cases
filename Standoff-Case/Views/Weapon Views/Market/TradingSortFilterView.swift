//
//  TradingSortFilterView.swift
//  Standoff-Case
//
//  Created by Andrey on 07.02.2023.
//

import UIKit

class TradingSortFilterView: UIView {
    
    // MARK: - Properties
    
    private lazy var backView: UIView = {
        let backView = UIView()
        backView.translatesAutoresizingMaskIntoConstraints = false
        backView.backgroundColor = .blackWith15Alpha
        return backView
    }()
    
    private lazy var sortingStackView: UIStackView = {
       let sortingStackView = UIStackView()
        sortingStackView.translatesAutoresizingMaskIntoConstraints = false
        sortingStackView.axis = .vertical
        sortingStackView.distribution = .fillEqually
        sortingStackView.spacing = 2
        return sortingStackView
    }()
    
    private lazy var sortingView: UIView = {
       let sortingView = UIView()
        sortingView.translatesAutoresizingMaskIntoConstraints = false
        sortingView.backgroundColor = .blackWith40Alpha
        return sortingView
    }()
    
    private lazy var sortingLabel: UILabel = {
       let sortingLabel = UILabel()
        sortingLabel.translatesAutoresizingMaskIntoConstraints = false
        sortingLabel.text = "Сортировать по:"
        sortingLabel.textColor = .textPrimary
        sortingLabel.textAlignment = .left
        sortingLabel.font = .oswald(size: 12)
        return sortingLabel
    }()
    
    private lazy var rareSortButton: UIButton = {
        let rareSortButton = UIButton(type: .system)
        rareSortButton.translatesAutoresizingMaskIntoConstraints = false
        rareSortButton.setTitle("Редкости", for: .normal)
        rareSortButton.setTitleColor(.textPrimary, for: .normal)
        rareSortButton.backgroundColor = .blackWith20Alpha
        rareSortButton.titleLabel?.font = .oswald(size: 12, weight: .light)
        return rareSortButton
    }()
    
    private lazy var priceSortButton: UIButton = {
        let priceSortButton = UIButton(type: .system)
        priceSortButton.translatesAutoresizingMaskIntoConstraints = false
        priceSortButton.setTitle("Цене", for: .normal)
        priceSortButton.setTitleColor(.textPrimary, for: .normal)
        priceSortButton.backgroundColor = .blackWith20Alpha
        priceSortButton.titleLabel?.font = .oswald(size: 12, weight: .light)
        return priceSortButton
    }()
    
    private lazy var filterStackView: UIStackView = {
       let filterStackView = UIStackView()
        filterStackView.translatesAutoresizingMaskIntoConstraints = false
        filterStackView.axis = .vertical
        filterStackView.spacing = 3
        return filterStackView
    }()
    
    private lazy var filterLabel: UILabel = {
       let filterLabel = UILabel()
        filterLabel.translatesAutoresizingMaskIntoConstraints = false
        filterLabel.text = "Фильтр"
        filterLabel.textColor = .textPrimary
        filterLabel.font = .oswald(size: 12)
        return filterLabel
    }()
    
    private lazy var filterButton: UIButton = {
       let filterButton = UIButton()
        filterButton.translatesAutoresizingMaskIntoConstraints = false
        filterButton.backgroundColor = .blackWith40Alpha
        if #available(iOS 15.0, *) {
            var buttonConfiguration = UIButton.Configuration.plain()
            buttonConfiguration.image = UIImage(named: "filter")
            buttonConfiguration.imagePlacement = .trailing
            buttonConfiguration.titleAlignment = .leading
            buttonConfiguration.contentInsets = .zero
            
            var attributedContainer = AttributedString("Фильтр", attributes: AttributeContainer([NSAttributedString.Key.font : UIFont.oswald(size: 12, weight: .regular), NSAttributedString.Key.foregroundColor: UIColor.textPrimary]))
            buttonConfiguration.attributedTitle = attributedContainer
            filterButton.configuration = buttonConfiguration
        } else {
            filterButton.setImage(UIImage(named: "filter"), for: .normal)
        }
        filterButton.contentMode = .scaleAspectFit
        filterButton.layer.masksToBounds = true
        return filterButton
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

extension TradingSortFilterView {
    
    private func configureView() {
        backgroundColor = .clear
        configureSubviews()
        setupConstraints()
    }
    
    private func configureSubviews() {
        addSubview(backView)
        backView.addSubview(sortingStackView)
        sortingStackView.addArrangedSubview(sortingView)
        sortingView.addSubview(sortingLabel)
        sortingStackView.addArrangedSubview(rareSortButton)
        sortingStackView.addArrangedSubview(priceSortButton)
        backView.addSubview(filterButton)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            
            backView.topAnchor.constraint(equalTo: self.topAnchor),
            backView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            backView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            backView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            sortingStackView.topAnchor.constraint(equalTo: backView.topAnchor),
            sortingStackView.leadingAnchor.constraint(equalTo: backView.leadingAnchor),
            sortingStackView.trailingAnchor.constraint(equalTo: backView.trailingAnchor),
            
            sortingLabel.topAnchor.constraint(equalTo: sortingView.topAnchor),
            sortingLabel.leadingAnchor.constraint(equalTo: sortingView.leadingAnchor, constant: 10),
            sortingLabel.trailingAnchor.constraint(equalTo: sortingView.trailingAnchor, constant: -10),
            sortingLabel.bottomAnchor.constraint(equalTo: sortingView.bottomAnchor),
            
            filterButton.topAnchor.constraint(equalTo: sortingStackView.bottomAnchor, constant: 30),
            filterButton.leadingAnchor.constraint(equalTo: backView.leadingAnchor),
            filterButton.trailingAnchor.constraint(equalTo: backView.trailingAnchor),
            filterButton.heightAnchor.constraint(equalTo: sortingView.heightAnchor),
            
        ])
    }
}
