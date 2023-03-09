//
//  ChartCreateView.swift
//  Standoff-Case
//
//  Created by Andrey on 06.03.2023.
//

import UIKit

class ChartCreateView: UIView {
    
    // MARK: - Properties
    
    private lazy var backView: UIView = {
        let backView = UIView()
        backView.translatesAutoresizingMaskIntoConstraints = false
        backView.backgroundColor = .blackWith35Alpha
        backView.layer.borderWidth = 2.5
        backView.layer.borderColor = UIColor.blackWith40Alpha.cgColor
        
        return backView
    }()
    
    // MARK: - Life cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        drawGraph()
    }
    
    func drawGraph() {

        let startColor: UIColor = UIColor(red: 134 / 255, green: 88 / 255, blue: 236 / 255, alpha: 1)
        let endColor: UIColor = UIColor(red: 244 / 255, green: 89 / 255, blue: 146 / 255, alpha: 1)
        
//        let colors = [startColor, endColor]
        
        let startPoint: CGPoint = CGPoint(x: backView.bounds.minX + 15, y: backView.bounds.maxY - 15)
        let endPoint: CGPoint = CGPoint(x: backView.bounds.maxX - 15, y: backView.bounds.minY + 15)
        let firstControlPoint: CGPoint = CGPoint(x: backView.bounds.maxX - 70, y: backView.bounds.maxY - 15)
        let secondControlPoint: CGPoint = CGPoint(x: backView.bounds.maxX - 15, y: backView.bounds.minY + 15)

        let graphPath = UIBezierPath()
        graphPath.move(to: startPoint)
        graphPath.addCurve(to: endPoint, controlPoint1: firstControlPoint, controlPoint2: secondControlPoint)

        let blueColor = UIColor.systemPink
        blueColor.setStroke()

        graphPath.lineWidth = 2.0
        graphPath.stroke()

        drowPoint(point: startPoint, color: .white, radius: 3)
        drowPoint(point: startPoint, color: startColor, radius: 1.5)
        drowPoint(point: endPoint, color: .white, radius: 3)
        drowPoint(point: endPoint, color: endColor, radius: 1.5)
    }

    func drowPoint(point: CGPoint, color: UIColor, radius: CGFloat) {
        let ovalPath = UIBezierPath(ovalIn: CGRect(x: point.x - radius, y: point.y - radius, width: radius * 2, height: radius * 2))
        color.setFill()
        ovalPath.fill()
    }
    
}

// MARK: - Extension

extension ChartCreateView {
    
    private func configureView() {
        configureSubViews()
        configureConstraints()
    }
    
    private func configureSubViews() {
        addSubview(backView)
    }
    
    private func configureConstraints() {
        NSLayoutConstraint.activate([
        
            backView.topAnchor.constraint(equalTo: topAnchor),
            backView.leadingAnchor.constraint(equalTo: leadingAnchor),
            backView.trailingAnchor.constraint(equalTo: trailingAnchor),
            backView.bottomAnchor.constraint(equalTo: bottomAnchor),
        
        ])
    }
}

