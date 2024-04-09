//
//  DetailViewController.swift
//  iTunesStore
//
//  Created by 김재석 on 4/8/24.
//

import UIKit
import RxSwift
import RxCocoa

final class DetailViewController: BaseViewController {
    
    let mainView = DetailView()
    var data: SearchResult?

    override func loadView() {
        self.view = mainView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        guard let data = data else { return }
        mainView.updateUI(data: data)
    }
    
    override func setNavigation() {

        let rightButton = UIBarButtonItem(
            image: UIImage(systemName: "bookmark"),
            style: .plain,
            target: self,
            action: nil
        )
        rightButton.tintColor = .systemBlue
        navigationItem.rightBarButtonItem = rightButton
    }
    
    override func bind() {
    
    }
}
