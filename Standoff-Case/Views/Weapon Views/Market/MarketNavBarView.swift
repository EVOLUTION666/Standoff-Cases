//
//  MarketNavBarView.swift
//  Standoff-Case
//
//  Created by Andrey on 07.02.2023.
//

import UIKit

protocol MarketNavBarViewDelegate: AnyObject {
    func didSelect(index: Int)
}


class MarketNavBarView: UIView {
    
    // MARK: - Properties
    
    weak var delegate: MarketNavBarViewDelegate?
    
    private var selectedIndex = 0 {
        didSet {
            [tradeAreaButton, historyButton].forEach {
                if $0.tag == oldValue {
                    $0.backgroundColor = .clear
                }
                if $0.tag == selectedIndex {
                    $0.backgroundColor = .grayWith50Alpha
                }
            }
        }
    }
    
    private lazy var tradeAreaButton: UIButton = {
        let tradeAreaButton = UIButton(type: .system)
        tradeAreaButton.translatesAutoresizingMaskIntoConstraints = false
        tradeAreaButton.setTitle("ПЛОЩАДКА", for: .normal)
        tradeAreaButton.setTitleColor(.textPrimary, for: .normal)
        tradeAreaButton.tag = 0
        tradeAreaButton.titleLabel?.font = UIFont(name: "Oswald", size: 18)
        tradeAreaButton.addTarget(self, action: #selector(didChangeSelected), for: .touchUpInside)
        return tradeAreaButton
    }()
    
    private lazy var historyButton: UIButton = {
        let historyButton = UIButton(type: .system)
        historyButton.translatesAutoresizingMaskIntoConstraints = false
        historyButton.setTitle("АКЦИИ", for: .normal)
        historyButton.setTitleColor(.textPrimary, for: .normal)
        historyButton.tag = 1
        historyButton.addTarget(self, action: #selector(didChangeSelected), for: .touchUpInside)
        historyButton.titleLabel?.font = UIFont(name: "Oswald", size: 18)
        return historyButton
    }()
    
    private lazy var buttonStackView: UIStackView = {
        let buttonStackView = UIStackView()
        buttonStackView.translatesAutoresizingMaskIntoConstraints = false
        buttonStackView.axis = .horizontal
        buttonStackView.distribution  = .fillEqually
        buttonStackView.alignment = UIStackView.Alignment.leading
        return buttonStackView
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
    
    @objc
    private func didChangeSelected(_ sender: UIButton) {
        self.selectedIndex = sender.tag
        delegate?.didSelect(index: sender.tag)
    }

}

// MARK: - Extension

extension MarketNavBarView {
    
    private func configureView() {
        backgroundColor = .blackWith40Alpha
        tradeAreaButton.backgroundColor = .grayWith50Alpha
        configureSubviews()
        setupConstraints()
    }
    
    private func configureSubviews() {
        addSubview(buttonStackView)
        buttonStackView.addArrangedSubview(tradeAreaButton)
        buttonStackView.addArrangedSubview(historyButton)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            
            buttonStackView.topAnchor.constraint(equalTo: topAnchor),
            buttonStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            buttonStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            buttonStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
        
        ])
    }
}
