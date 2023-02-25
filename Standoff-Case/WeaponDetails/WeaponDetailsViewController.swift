//
//  WeaponDetailsViewController.swift
//  Standoff-Case
//
//  Created by Astemir Shibzuhov on 2/8/23.
//

import UIKit



class WeaponDetailsViewController: BaseViewController {
    struct DisplayItem {
        let mode: WeaponDetailsMode
    }
    
    enum WeaponDetailsMode {
        case flat, volumetric
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}
