//
//  CustomAlertView.swift
//  Standoff-Case
//
//  Created by Andrey on 03.04.2023.
//

import UIKit

class InventoryAlertView: UIView {
    
    private lazy var previewButton: UIButton = {
        let previewButton = UIButton()
        previewButton.setTitle("Осмотреть", for: .normal)
        previewButton.translatesAutoresizingMaskIntoConstraints = false
        previewButton.backgroundColor = .blue
        previewButton.addTarget(self, action: #selector(previewButtonTapped), for: .touchUpInside)
        return previewButton
    }()
    
    private lazy var alertView: UIView = {
        let alertView = UIView()
        alertView.translatesAutoresizingMaskIntoConstraints = false
        alertView.backgroundColor = .green
        return alertView
    }()
    
    private lazy var buttonStackView: UIStackView = {
        let buttonStackView = UIStackView(arrangedSubviews: [previewButton])
        buttonStackView.translatesAutoresizingMaskIntoConstraints = false
        buttonStackView.axis = .vertical
        buttonStackView.spacing = 0
        return buttonStackView
    }()
    
    var delegate: CustomAlertViewDelegate?
    
    // MARK: - Life cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureView()
    }
    
    // MARK: - @objc funcs

    @objc func previewButtonTapped() {
        delegate?.previewButtonMethodDelegate()
        print("suka")
    }
}

extension InventoryAlertView {
    private func configureView() {
        configureSubviews()
        configureConstraints()
    }
    
    private func configureSubviews() {
        addSubview(alertView)
        alertView.addSubview(buttonStackView)
    }
    
    private func configureConstraints() {
        NSLayoutConstraint.activate([
            buttonStackView.topAnchor.constraint(equalTo: alertView.topAnchor),
            buttonStackView.leadingAnchor.constraint(equalTo: alertView.leadingAnchor),
            buttonStackView.trailingAnchor.constraint(equalTo: alertView.trailingAnchor),
            buttonStackView.bottomAnchor.constraint(equalTo: alertView.bottomAnchor),
        ])
    }
}
