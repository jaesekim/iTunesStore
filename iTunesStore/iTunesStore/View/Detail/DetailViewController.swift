//
//  DetailViewController.swift
//  iTunesStore
//
//  Created by 김재석 on 4/8/24.
//

import UIKit

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
    
    
}
