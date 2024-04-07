//
//  BaseView.swift
//  iTunesStore
//
//  Created by 김재석 on 4/8/24.
//

import UIKit

class BaseView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureHierarchy()
        configureConstraints()
        configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configureHierarchy() {}
    func configureConstraints() {}
    func configureView() {
        backgroundColor = .white
    }
}
