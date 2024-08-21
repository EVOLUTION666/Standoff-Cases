//
//  SelectionView.swift
//  Standoff-Case
//
//  Created by Andrey on 25.02.2023.
//

import UIKit

class SelectionView: UIView {
    
    // MARK: - Properties
    
    private lazy var strokeView: UIView = {
        let strokeView = UIView()
        strokeView.translatesAutoresizingMaskIntoConstraints = false
        strokeView.backgroundColor = .grayWith50Alpha
        strokeView.layer.cornerRadius = 5
        strokeView.layer.masksToBounds = true
        return strokeView
    }()
    
    private lazy var warningImage: UIImageView = {
        let warningImage = UIImageView(image: UIImage(named: "warning"))
        warningImage.translatesAutoresizingMaskIntoConstraints = false
        return warningImage
    }()
    
    private lazy var warningLabel: UILabel = {
        let warningLabel = UILabel()
        warningLabel.translatesAutoresizingMaskIntoConstraints = false
        warningLabel.text = "Выберите предметы из инвентаря!"
        warningLabel.font = .oswald(size: 10)
        warningLabel.textColor = .white
        warningLabel.text = warningLabel.text?.uppercased()
        return warningLabel
    }()
    
    private lazy var plusButton: UIImageView = {
       let plusButton = UIImageView()
        plusButton.image = UIImage(named: "plusButton")
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped))
        plusButton.isUserInteractionEnabled = true
        plusButton.addGestureRecognizer(tapGestureRecognizer)
        plusButton.translatesAutoresizingMaskIntoConstraints = false
        return plusButton
    }()
    
    private lazy var coefficientStackView: UIStackView = {
        let coefficientStackView = UIStackView(arrangedSubviews: [coeffTextField, depositView, winView])
        coefficientStackView.translatesAutoresizingMaskIntoConstraints = false
        coefficientStackView.axis = .horizontal
        coefficientStackView.distribution = .fillProportionally
        coefficientStackView.spacing = 5
        return coefficientStackView
    }()
    
    private lazy var coeffTextField: UITextField = {
       let coeffTextField = UITextField()
        coeffTextField.translatesAutoresizingMaskIntoConstraints = false
        coeffTextField.backgroundColor = .blackWith35Alpha
        coeffTextField.addPadding(padding: .left(5))
        coeffTextField.attributedPlaceholder = NSAttributedString(
            string: "ВВЕДИТЕ КОЭФФИЦИЕНТ",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.white]
        )
        coeffTextField.textColor = .white
        coeffTextField.keyboardType = .decimalPad
        coeffTextField.font = .oswald(size: 8)
        coeffTextField.layer.cornerRadius = 5
        coeffTextField.layer.masksToBounds = true
        
        return coeffTextField
    }()
    
    private lazy var depositView: UIView = {
       let depositView = UIView()
        depositView.translatesAutoresizingMaskIntoConstraints = false
        depositView.backgroundColor = .gameButtonColor
        depositView.layer.cornerRadius = 5
        depositView.layer.masksToBounds = true
        return depositView
    }()
    
    private lazy var depositLabel: UILabel = {
       let depositLabel = UILabel()
        depositLabel.translatesAutoresizingMaskIntoConstraints = false
        depositLabel.textColor = .white
        depositLabel.text = "Внесено: 0"
        depositLabel.text = depositLabel.text?.uppercased()
        depositLabel.font = .oswald(size: 8)
        return depositLabel
    }()
    
    private lazy var winView: UIView = {
       let winView = UIView()
        winView.translatesAutoresizingMaskIntoConstraints = false
        winView.backgroundColor = .gameButtonColor
        winView.layer.cornerRadius = 5
        winView.layer.masksToBounds = true
        return winView
    }()
    
    private lazy var winLabel: UILabel = {
       let winLabel = UILabel()
        winLabel.translatesAutoresizingMaskIntoConstraints = false
        winLabel.textColor = .white
        winLabel.text = "Выигрыш: 0"
        winLabel.font = .oswald(size: 8)
        winLabel.text = winLabel.text?.uppercased()
        return winLabel
    }()
    
    private lazy var xStackView: UIStackView = {
       let xStackView = UIStackView(arrangedSubviews: [firstXButton, secondXButton, thirdXButton, fourthXButton, settingButton])
        xStackView.translatesAutoresizingMaskIntoConstraints = false
        xStackView.axis = .horizontal
        xStackView.distribution = .fillEqually
        xStackView.spacing = 5
        return xStackView
    }()
    
    private lazy var firstXButton: UIButton = {
        let firstXButton = UIButton(type: .system)
        firstXButton.translatesAutoresizingMaskIntoConstraints = false
        firstXButton.setTitle("1.1X", for: .normal)
        firstXButton.setTitleColor(.white, for: .normal)
        firstXButton.backgroundColor = .gameButtonColor
//        firstXButton.addDashedBorder()
        firstXButton.titleLabel?.font = .oswald(size: 11)
        firstXButton.layer.cornerRadius = 5
        firstXButton.layer.masksToBounds = true
        return firstXButton
    }()
    
    private lazy var secondXButton: UIButton = {
       let secondXButton = UIButton(type: .system)
        secondXButton.translatesAutoresizingMaskIntoConstraints = false
        secondXButton.setTitle("1.5X", for: .normal)
        secondXButton.setTitleColor(.white, for: .normal)
        secondXButton.backgroundColor = .gameButtonColor
        secondXButton.titleLabel?.font = .oswald(size: 11)
        secondXButton.layer.cornerRadius = 5
        secondXButton.layer.masksToBounds = true
        return secondXButton
    }()
    
    private lazy var thirdXButton: UIButton = {
       let thirdXButton = UIButton(type: .system)
        thirdXButton.translatesAutoresizingMaskIntoConstraints = false
        thirdXButton.setTitle("2X", for: .normal)
        thirdXButton.setTitleColor(.white, for: .normal)
        thirdXButton.backgroundColor = .gameButtonColor
        thirdXButton.titleLabel?.font = .oswald(size: 11)
        thirdXButton.layer.cornerRadius = 5
        thirdXButton.layer.masksToBounds = true
        return thirdXButton
    }()
    
    private lazy var fourthXButton: UIButton = {
       let fourthXButton = UIButton(type: .system)
        fourthXButton.translatesAutoresizingMaskIntoConstraints = false
        fourthXButton.setTitle("3X", for: .normal)
        fourthXButton.setTitleColor(.white, for: .normal)
        fourthXButton.backgroundColor = .gameButtonColor
        fourthXButton.titleLabel?.font = .oswald(size: 11)
        fourthXButton.layer.cornerRadius = 5
        fourthXButton.layer.masksToBounds = true
        return fourthXButton
    }()
    
    private lazy var settingButton: UIButton = {
       let settingButton = UIButton(type: .system)
        settingButton.translatesAutoresizingMaskIntoConstraints = false
        settingButton.tintColor = .white
        settingButton.setImage(UIImage(named: "settings"), for: .normal)
        settingButton.backgroundColor = .gameButtonColor
        settingButton.layer.cornerRadius = 5
        settingButton.layer.masksToBounds = true
        return settingButton
    }()
    
    private lazy var betStackView: UIStackView = {
       let betStackView = UIStackView(arrangedSubviews: [betButton])
        betStackView.translatesAutoresizingMaskIntoConstraints = false
        betStackView.axis = .horizontal
        betStackView.distribution = .fillEqually
        return betStackView
    }()
    
    private lazy var betButton: UIButton = {
       let betButton = UIButton(type: .system)
        betButton.translatesAutoresizingMaskIntoConstraints = false
        betButton.setTitleColor(.white, for: .normal)
        betButton.setTitle("СОЗДАТЬ СТАВКУ", for: .normal)
        betButton.titleLabel?.font = .oswald(size: 11)
        betButton.backgroundColor = .gameButtonColor
        betButton.layer.cornerRadius = 5
        betButton.layer.masksToBounds = true
        return betButton
    }()

    // MARK: - Life cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureView()
    }
    
    // MARK: - @objc func
    
    @objc func imageTapped() {
        print("hello world")
    }
    
}

// MARK: - Extension

extension SelectionView {
    
    private func configureView() {
        configureSubviews()
        configureConstraints()
    }
    
    private func configureSubviews() {
        addSubview(strokeView)
        strokeView.addSubview(warningImage)
        strokeView.addSubview(warningLabel)
        
        addSubview(plusButton)
        
        addSubview(coefficientStackView)
        depositView.addSubview(depositLabel)
        winView.addSubview(winLabel)
        
        addSubview(xStackView)
        addSubview(betStackView)
        
    }
    
    private func configureConstraints() {
        NSLayoutConstraint.activate([
            
            strokeView.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            strokeView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            strokeView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
            strokeView.heightAnchor.constraint(equalToConstant: 25),
            
            warningImage.leadingAnchor.constraint(equalTo: strokeView.leadingAnchor, constant:  5),
            warningImage.centerYAnchor.constraint(equalTo: strokeView.centerYAnchor),
            warningImage.widthAnchor.constraint(equalToConstant: 18),
            warningImage.heightAnchor.constraint(equalToConstant: 18),
            
            warningLabel.topAnchor.constraint(equalTo: strokeView.topAnchor),
            warningLabel.leadingAnchor.constraint(equalTo: warningImage.trailingAnchor, constant: 5),
            warningLabel.bottomAnchor.constraint(equalTo: strokeView.bottomAnchor),
            
            plusButton.topAnchor.constraint(equalTo: strokeView.bottomAnchor, constant: 15),
            plusButton.bottomAnchor.constraint(equalTo: coefficientStackView.topAnchor, constant: -15),
            plusButton.centerXAnchor.constraint(equalTo: centerXAnchor),

            coefficientStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            coefficientStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
            coefficientStackView.heightAnchor.constraint(equalToConstant: 20),
            
            depositView.widthAnchor.constraint(equalToConstant: 60),
            depositLabel.centerYAnchor.constraint(equalTo: depositView.centerYAnchor),
            depositLabel.centerXAnchor.constraint(equalTo: depositView.centerXAnchor),
            
            winView.widthAnchor.constraint(equalToConstant: 60),
            winLabel.centerYAnchor.constraint(equalTo: winView.centerYAnchor),
            winLabel.centerXAnchor.constraint(equalTo: winView.centerXAnchor),
            
            xStackView.topAnchor.constraint(equalTo: coefficientStackView.bottomAnchor, constant: 5),
            xStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            xStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
            xStackView.bottomAnchor.constraint(equalTo: betButton.topAnchor, constant: -5),
            xStackView.heightAnchor.constraint(equalToConstant: 25),
            
            betStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            betStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
            betStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5),
            betStackView.heightAnchor.constraint(equalToConstant: 25),
            
        ])
    }
    
}

extension UIView {
        func addDashedBorder() {
            let color = UIColor.orange.cgColor
    
            let shapeLayer:CAShapeLayer = CAShapeLayer()
            let frameSize = self.frame.size
            let shapeRect = CGRect(x: 0, y: 0, width: frameSize.width, height: frameSize.height)
    
            shapeLayer.bounds = shapeRect
            shapeLayer.position = CGPoint(x: frameSize.width/2, y: frameSize.height/2)
            shapeLayer.fillColor = UIColor.clear.cgColor
            shapeLayer.strokeColor = color
            shapeLayer.lineWidth = 4
            shapeLayer.lineJoin = CAShapeLayerLineJoin.round
            shapeLayer.lineDashPattern = [6,3]
            shapeLayer.path = UIBezierPath(roundedRect: shapeRect, cornerRadius: 5).cgPath
    
            self.layer.addSublayer(shapeLayer)
        }
}
