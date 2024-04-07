//
//  BaseViewController.swift
//  iTunesStore
//
//  Created by 김재석 on 4/8/24.
//

import UIKit

class BaseViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setNavigation()
        bind()
    }
    
    func setNavigation() {}
    func bind() {}
}
