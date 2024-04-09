//
//  BaseViewController.swift
//  iTunesStore
//
//  Created by 김재석 on 4/8/24.
//

import UIKit
import Toast

class BaseViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setNavigation()
        bind()
    }
    
    func setNavigation() {
        let backBarButtonItem = UIBarButtonItem(
            title: nil,
            style: .plain,
            target: self,
            action: nil
        )
        
        navigationItem.backBarButtonItem = backBarButtonItem
    }
    func bind() {}
    func showToast(_ message: String) {
        view.makeToast(message)
    }
}
