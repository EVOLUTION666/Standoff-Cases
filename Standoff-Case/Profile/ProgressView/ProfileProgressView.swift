//
//  ProfileProgressView.swift
//  Standoff-Case
//
//  Created by Astemir Shibzuhov on 2/6/23.
//

import UIKit

class ProfileProgressView: UIView {
    private lazy var progressView: ProgressView = {
        let pv = ProgressView().forAutoLayout()
        return pv
    }()
    
    private lazy var squareImageView: UIImageView = {
        let iv = UIImageView().forAutoLayout()
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        iv.setSize(size: .init(width: 22, height: 22))
        iv.image = .init(named: "squareIcon")
        return iv
    }()
    
    private lazy var textLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .textPrimary
        lbl.textAlignment = .center
        lbl.font = .oswald(size: 15)
        lbl.text = "5"
        return lbl.forAutoLayout()
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .blackWith50Alpha
        addSubview(progressView)
        addSubview(textLabel)
        addSubview(squareImageView)
        
        NSLayoutConstraint.activate([
            squareImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            squareImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            textLabel.leadingAnchor.constraint(equalTo: squareImageView.trailingAnchor),
            textLabel.centerYAnchor.constraint(equalTo: squareImageView.centerYAnchor),
            
            progressView.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            progressView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5),
            progressView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            progressView.leadingAnchor.constraint(equalTo: textLabel.trailingAnchor, constant: 5),
            progressView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.6)
        ])
        progressView.setDisplayItem(.init(startText: "Hello", endTextString: "OK", startProgress: 0.3))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
