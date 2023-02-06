//
//  SideTabBarController.swift
//  Standoff-Case
//
//  Created by Astemir Shibzuhov on 1/28/23.
//

import UIKit

class SideTabBarController: UIViewController, SideTabBarDelegate {
    private lazy var sideTabBar: SideTabBar = {
        let tabBar = SideTabBar()
        tabBar.backgroundColor = .blackWith70Alpha
        return tabBar.forAutoLayout()
    }()
    
    override var prefersHomeIndicatorAutoHidden: Bool {
        return true
    }
    
    override var preferredScreenEdgesDeferringSystemGestures: UIRectEdge {
        return [.bottom]
    }
    
    private lazy var gradient: CAGradientLayer = .baseGradientLayer
    
    private var viewControllers: [UIViewController] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.layer.addSublayer(gradient)
        self.setupUI()
        
        let profileVC = ProfileViewController()
        
        let weaponVC = WeaponViewController()

        let tasksVC = TasksViewController()
        
        self.viewControllers = [profileVC, weaponVC, tasksVC]
        self.add(profileVC)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setNeedsUpdateOfHomeIndicatorAutoHidden()
        setNeedsUpdateOfScreenEdgesDeferringSystemGestures()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        gradient.frame = view.bounds
    }
    
    private func setupUI() {
        view.addSubview(sideTabBar)
        NSLayoutConstraint.activate([
            sideTabBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            sideTabBar.topAnchor.constraint(equalTo: view.topAnchor),
            sideTabBar.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            sideTabBar.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 50)
        ])
        
        sideTabBar.setItems([.init(title: nil, image: .init(named: "profile")!),
                             .init(title: nil, image: .init(named: "weapon")!),
                             .init(title: nil, image: .init(named: "game")!)])
        self.sideTabBar.sideTabBarDelegate = self
        self.sideTabBar.backgroundColor = .clear
    }
    
    func didSelect(index: Int) {
        viewControllers.forEach({ $0.remove() })
        add(viewControllers[index])
    }
    
    func add(_ child: UIViewController) {
        addChild(child)
        child.view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(child.view)
        NSLayoutConstraint.activate([
            child.view.leadingAnchor.constraint(equalTo: sideTabBar.trailingAnchor),
            child.view.topAnchor.constraint(equalTo: view.topAnchor),
            child.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            child.view.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        child.didMove(toParent: self)
    }

}

extension UIViewController {
   
    func remove() {

        willMove(toParent: nil)
        view.removeFromSuperview()
        removeFromParent()
    }
}


extension UIView {
    func forAutoLayout() -> Self {
        self.translatesAutoresizingMaskIntoConstraints = false
        return self
    }
    
    func setSize(width: CGFloat? = nil, height: CGFloat? = nil) {
        var constraints = [NSLayoutConstraint]()
        
        if let width = width {
            constraints.append(self.widthAnchor.constraint(equalToConstant: width))
        }
        
        if let height = height {
            constraints.append(self.heightAnchor.constraint(equalToConstant: height))
        }
        
        NSLayoutConstraint.activate(constraints)
    }
    
    func setSize(size: CGSize) {
        self.setSize(width: size.width, height: size.height)
    }
    
    func setSimpleConstraints(constant: CGFloat = 0) {
        guard let superview = superview else {
            return
        }
        NSLayoutConstraint.activate([
            self.topAnchor.constraint(equalTo: superview.topAnchor, constant: constant),
            self.leadingAnchor.constraint(equalTo: superview.leadingAnchor, constant: constant),
            self.trailingAnchor.constraint(equalTo: superview.trailingAnchor, constant: -constant),
            self.bottomAnchor.constraint(equalTo: superview.bottomAnchor, constant: -constant)
        ])
    }
}

