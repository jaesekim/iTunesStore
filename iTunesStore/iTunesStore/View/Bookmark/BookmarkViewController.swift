//
//  BookmarkViewController.swift
//  iTunesStore
//
//  Created by 김재석 on 4/8/24.
//

import UIKit

final class BookmarkViewController: BaseViewController {

    let mainView = BookmarkView()

    override func loadView() {
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    
    }
    override func setNavigation() {
        super.setNavigation()
        navigationItem.title = "북마크"
    }

}
