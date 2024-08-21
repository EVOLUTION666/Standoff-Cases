//
//  EmptyCOntroller.swift
//  Standoff-Case
//
//  Created by Andrey on 09.04.2023.
//

import UIKit

class EmptyCOntroller: UIViewController {
    
    private lazy var cancleButton: UIButton = {
        let cancleButton = UIButton()
        cancleButton.backgroundColor = .black
        cancleButton.setTitle("Cancel", for: .normal)
        cancleButton.addTarget(self, action: #selector(didCancel), for: .touchUpInside)
        cancleButton.translatesAutoresizingMaskIntoConstraints = false
        return cancleButton
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
        setupUI()
    }

    @objc func didCancel() {
        dismiss(animated: true)
    }
    
    func setupUI() {
        view.addSubview(cancleButton)
        setupConstaints()
    }
    
    private func setupConstaints() {
        NSLayoutConstraint.activate([
            cancleButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            cancleButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            cancleButton.widthAnchor.constraint(equalToConstant: 200),
        ])
    }
    
}

