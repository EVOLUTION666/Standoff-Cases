//
//  GroupedStackView.swift
//  Standoff-Case
//
//  Created by Astemir Shibzuhov on 2/5/23.
//

import UIKit

protocol GroupedStackViewDataSource: AnyObject {
    func groupedStack(groupedView: GroupedStackView, view for: IndexPath) -> UIView
    func numberOfGroups() -> Int
    func numberOfItems(in group: Int) -> Int
    func groupesDirection() -> GroupedStackView.GroupedDiraction
    func groupsSapcing() -> CGFloat
    func itemsSpacing(groupIndex: Int) -> CGFloat
    func itemSize(groupView: GroupedStackView, in group: Int) -> CGSize
    func contentInsets() -> UIEdgeInsets
    func scrollableInsets() -> UIEdgeInsets
}

extension GroupedStackViewDataSource {
    func groupesDirection() -> GroupedStackView.GroupedDiraction {
        return .horizontal
    }
    
    func groupsSapcing() -> CGFloat {
        return 8
    }
    
    func itemsSpacing(groupIndex: Int) -> CGFloat {
        return 8
    }
    
    func itemSize(groupView: GroupedStackView, in group: Int) -> CGSize {
        return .init(width: 50, height: 50)
    }
    
    func contentInsets() -> UIEdgeInsets {
        .init(top: 8, left: 8, bottom: -8, right: -8)
    }
    
    func scrollableInsets() -> UIEdgeInsets {
        return .zero
    }
}

protocol GroupedStackViewDelegate: AnyObject {
    func groupedStackView(didSelect itemAt: IndexPath)
}

extension GroupedStackViewDelegate {
    func groupedStackView(didSelect itemAt: IndexPath) {}
}

class GroupedStackView: UIView {
    enum GroupedDiraction {
        case horizontal, vertical
    }
    private var frameSettedForView = false
    
    private var stackViews: [UIStackView] = []
    private(set) lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        return scrollView.forAutoLayout()
    }()
    
    weak var dataSource: GroupedStackViewDataSource? {
        didSet {
            if self.frameSettedForView {
                self.reloadData()
            }
        }
    }
    weak var delegate: GroupedStackViewDelegate?
    private lazy var contentStackView = UIStackView(arrangedSubviews: stackViews).forAutoLayout()
    
    private var contentTopAnchor: NSLayoutConstraint!
    private var contentBottomAnchor: NSLayoutConstraint!
    private var contentLeadingAnchor: NSLayoutConstraint!
    private var contentTrailingAnchor: NSLayoutConstraint!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(self.scrollView)
        self.scrollView.addSubview(contentStackView)
        
        self.contentTopAnchor = scrollView.topAnchor.constraint(equalTo: topAnchor).activated()
        self.contentLeadingAnchor = scrollView.leadingAnchor.constraint(equalTo: leadingAnchor).activated()
        self.contentBottomAnchor = scrollView.bottomAnchor.constraint(equalTo: bottomAnchor).activated()
        self.contentTrailingAnchor = scrollView.trailingAnchor.constraint(equalTo: trailingAnchor).activated()
        
        contentStackView.topAnchor.constraint(equalTo: scrollView.topAnchor).activated()
        contentStackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).activated()
        contentStackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).activated()
        contentStackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).activated()
   
        contentStackView.distribution = .equalCentering
        contentStackView.alignment = .top
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        if !self.frameSettedForView {
            self.reloadData()
            self.frameSettedForView = true
        }
    }
    
    private func updateData() {
        guard let dataSource = self.dataSource else {
            return
        }
        self.contentStackView.spacing = dataSource.groupsSapcing()
        
        switch dataSource.groupesDirection() {
        case .horizontal:
            contentStackView.axis = .vertical
            contentStackView.heightAnchor.constraint(lessThanOrEqualTo: scrollView.heightAnchor).activated()
        case .vertical:
            contentStackView.axis = .horizontal
            contentStackView.widthAnchor.constraint(lessThanOrEqualTo: scrollView.widthAnchor).activated()
        }
        stackViews.forEach({
            contentStackView.addArrangedSubview($0)
        })
    }
    
    private var itemsUUID: [Int: IndexPath] = [:]
    
    private func initGroups() {
        guard let dataSource = self.dataSource else {
            return
        }
        
        let numberGroups = dataSource.numberOfGroups()
        var needSize: CGFloat = 0
        if dataSource.groupesDirection() == .horizontal {
            needSize += dataSource.groupsSapcing() + dataSource.contentInsets().top + abs(dataSource.contentInsets().bottom)
        } else {
            needSize += dataSource.groupsSapcing() + dataSource.contentInsets().left + abs(dataSource.contentInsets().right)
        }
        var allItems = 0
        for i in 0..<numberGroups {
            let numberOfItems = dataSource.numberOfItems(in: i)
            
            let itemSize = dataSource.itemSize(groupView: self, in: i)
            needSize += dataSource.groupesDirection() == .vertical ? itemSize.width : itemSize.height
            var items: [UIView] = []
            for j in 0..<numberOfItems {
                let view = dataSource.groupedStack(groupedView: self, view: .init(item: j, section: i)).forAutoLayout()
                let gesture = UITapGestureRecognizer(target: self, action: #selector(self.didTapItem(_:)))
                view.addGestureRecognizer(gesture)
                let index = allItems
                allItems += 1
                view.tag = index
                self.itemsUUID[index] = .init(item: j, section: i)
                
                if dataSource.groupesDirection() == .vertical {
                    if needSize <= frame.width {
                        view.setSize(size: itemSize)
                    } else {
                        view.setSize(size: .zero)
                    }
                }
                
                if dataSource.groupesDirection() == .horizontal {
                    if needSize <= frame.height {
                        view.setSize(size: itemSize)
                    } else {
                        view.setSize(size: .zero)
                    }
                }
                
                items.append(view)
            }
            let stackView = UIStackView(arrangedSubviews: items).forAutoLayout()
            stackView.spacing = dataSource.itemsSpacing(groupIndex: i)
            stackView.axis = dataSource.groupesDirection() == .horizontal ? .horizontal : .vertical
            stackView.alignment = .center
            stackView.distribution = .fill
            if needSize <= frame.width && dataSource.groupesDirection() == .vertical {
                stackView.widthAnchor.constraint(equalToConstant: itemSize.width).activated()
            }
            
            if needSize <= frame.height && dataSource.groupesDirection() == .horizontal {
                stackView.heightAnchor.constraint(equalToConstant: itemSize.height).activated()
            }
    
            self.stackViews.append(stackView)
        }
        self.updateData()
    }
    
    func reloadData() {
        self.stackViews.removeAll()
        self.itemsUUID.removeAll()
        self.contentStackView.arrangedSubviews.forEach({ $0.removeFromSuperview() })
        if let dataSource = dataSource {
            contentTopAnchor.constant = dataSource.contentInsets().top
            contentBottomAnchor.constant = dataSource.contentInsets().bottom
            contentLeadingAnchor.constant = dataSource.contentInsets().left
            contentTrailingAnchor.constant = dataSource.contentInsets().right
            
            self.scrollView.contentInset = dataSource.scrollableInsets()
        }
        
        self.initGroups()
    }
    
    @objc
    private func didTapItem(_ sender: UITapGestureRecognizer) {
        guard let tag = sender.view?.tag,
              let indexPath = self.itemsUUID[tag] else { return }
        self.delegate?.groupedStackView(didSelect: indexPath)
    }
}
