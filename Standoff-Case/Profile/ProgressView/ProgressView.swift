//
//  ProgressView.swift
//  Standoff-Case
//
//  Created by Astemir Shibzuhov on 2/6/23.
//

import UIKit

class ProgressView: UIView {
    enum Constants {
        static let progressHeight: CGFloat = 5
    }
    
    struct DisplayItem {
        let startText: String
        let endTextString: String
        let startProgress: Double
    }
    
    private lazy var startLabel: UILabel = {
        let lbl = UILabel().forAutoLayout()
        lbl.textColor = .textPrimary
        lbl.textAlignment = .left
        lbl.font = .oswald(size: 13)
        return lbl
    }()
    
    private lazy var endLabel: UILabel = {
        let lbl = UILabel().forAutoLayout()
        lbl.textColor = .textPrimary
        lbl.textAlignment = .right
        lbl.font = .oswald(size: 13)
        return lbl
    }()
    
    private lazy var progressBackgroundLayer = CALayer()
    private lazy var progressLayer = CALayer()
    
    private var progress: Double = 0.5 {
        didSet {
            guard progress >= 0 && progress <= 1 else { return }
            progressLayer.frame.size.width = progressBackgroundLayer.frame.width * CGFloat(progress)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layer.addSublayer(progressBackgroundLayer)
        progressBackgroundLayer.addSublayer(progressLayer)
        addSubview(startLabel)
        addSubview(endLabel)
        
        NSLayoutConstraint.activate([
            startLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            startLabel.topAnchor.constraint(equalTo: topAnchor),
            startLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -(Constants.progressHeight + 4)),
            
            endLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            endLabel.topAnchor.constraint(equalTo: topAnchor),
            endLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -(Constants.progressHeight + 4)),
        ])
        
        progressBackgroundLayer.backgroundColor = UIColor.textPrimary.withAlphaComponent(0.2).cgColor
        progressLayer.backgroundColor = UIColor.accentOrange.cgColor
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        progressBackgroundLayer.frame = .init(origin: .init(x: 0, y: frame.height - Constants.progressHeight), size: .init(width: frame.width, height: Constants.progressHeight))
        progressLayer.frame = .init(origin: .zero, size: .init(width: progressBackgroundLayer.frame.width * CGFloat(progress), height: progressBackgroundLayer.frame.height))
        
    }
    
    func setDisplayItem(_ model: DisplayItem) {
        self.startLabel.text = model.startText
        self.endLabel.text = model.endTextString
        self.changeProgress(model.startProgress)
    }
    
    func changeProgress(_ progress: Double) {
        self.progress = progress
    }
}
