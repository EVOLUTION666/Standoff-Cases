//
//  ChartView.swift
//  Standoff-Case
//
//  Created by Andrey on 25.02.2023.
//

import UIKit

class ChartView: UIView {
    
    // MARK: - Properties
    
    var countDown = 10.0
    var timer = Timer()
    
    private lazy var backView: UIView = {
        let backView = UIView()
        backView.translatesAutoresizingMaskIntoConstraints = false
        backView.backgroundColor = .clear
        backView.layer.borderWidth = 4
        backView.layer.borderColor = UIColor.blackWith40Alpha.cgColor
        return backView
    }()
    
    private lazy var timerLabel: UILabel = {
        let timerLabel = UILabel()
        timerLabel.text = "3.28"
        timerLabel.font = UIFont.init(name: "DigitalNumbers-Regular", size: 24)
        timerLabel.textColor = .white
        timerLabel.translatesAutoresizingMaskIntoConstraints = false
        return timerLabel
    }()
    
    private lazy var clockImage: UIImageView = {
       let clockImage = UIImageView(image: UIImage(named: "clock"))
        clockImage.translatesAutoresizingMaskIntoConstraints = false
        return clockImage
    }()
    
    private lazy var itemsStackView: UIStackView = {
        let itemsStackView = UIStackView()
        itemsStackView.spacing = 5
        itemsStackView.translatesAutoresizingMaskIntoConstraints = false
        return itemsStackView
        
    }()
    
    // MARK: - Life cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
//    override func draw(_ rect: CGRect) {
//        super.draw(rect)
//
//        let startPoint: CGPoint = CGPoint(x: backView.bounds.minX + 15, y: backView.bounds.maxY - 15)
//        let endPoint: CGPoint = CGPoint(x: backView.bounds.maxX - 15, y: backView.bounds.minY + 15)
//        let firstControlPoint: CGPoint = CGPoint(x: backView.bounds.maxX - 70, y: backView.bounds.maxY - 15)
//        let secondControlPoint: CGPoint = CGPoint(x: backView.bounds.maxX - 15, y: backView.bounds.minY + 15)
//
//        let graphPath = UIBezierPath()
//        graphPath.move(to: startPoint)
//        graphPath.addCurve(to: endPoint, controlPoint1: firstControlPoint, controlPoint2: secondControlPoint)
//
//        let blueColor = UIColor.purple
//        blueColor.setStroke()
//
//        graphPath.lineWidth = 3.0
//        graphPath.stroke()
//
//        drowPoint(point: startPoint, color: .white, radius: 4)
//        drowPoint(point: endPoint, color: .white, radius: 4)
//
//    }
//
//    func drowPoint(point: CGPoint, color: UIColor, radius: CGFloat) {
//        let ovalPath = UIBezierPath(ovalIn: CGRect(x: point.x - radius, y: point.y - radius, width: radius * 2, height: radius * 2))
//        color.setFill()
//        ovalPath.fill()
//    }
    
}

// MARK: - Extension

extension ChartView {
    
    func startCountDown() {
        timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(countDownMethod), userInfo: nil, repeats: true)
    }
    
    @objc func countDownMethod() {
        
        if countDown > 0.01 {
            countDown -= 0.01
            timerLabel.text = String(NSString(format:"%.2f", countDown)) 
        } else {
            timer.invalidate()
        }

    }
    
    private func configureView() {
        configureSubViews()
        configureConstraints()
        startCountDown()
    }
    
    private func configureSubViews() {
        addSubview(backView)
        backView.addSubview(itemsStackView)
        itemsStackView.addArrangedSubview(clockImage)
        itemsStackView.addArrangedSubview(timerLabel)
    }
    
    private func configureConstraints() {
        NSLayoutConstraint.activate([
        
            backView.topAnchor.constraint(equalTo: topAnchor),
            backView.leadingAnchor.constraint(equalTo: leadingAnchor),
            backView.trailingAnchor.constraint(equalTo: trailingAnchor),
            backView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            itemsStackView.centerXAnchor.constraint(equalTo: backView.centerXAnchor),
            itemsStackView.centerYAnchor.constraint(equalTo: backView.centerYAnchor),
            
            clockImage.heightAnchor.constraint(equalToConstant: 35),
            clockImage.widthAnchor.constraint(equalToConstant: 35),
        
        ])
    }
    
}
