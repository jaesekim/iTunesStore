//
//  SearchViewController.swift
//  iTunesStore
//
//  Created by 김재석 on 4/8/24.
//

import UIKit
import RxSwift
import RxCocoa

final class SearchViewController: BaseViewController {

    let mainView = SearchView()
    let viewModel = SearchViewModel()
    let disposeBag = DisposeBag()

    override func loadView() {
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func setNavigation() {
        navigationItem.title = "검색"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
        
        let backBarButtonItem = UIBarButtonItem(
            title: nil,
            style: .plain,
            target: self,
            action: nil
        )
        
        navigationItem.backBarButtonItem = backBarButtonItem
    }
    override func bind() {

        let input = SearchViewModel.Input(
            searchTap: mainView.searchBar.rx.searchButtonClicked,
            searchText: mainView.searchBar.rx.text
        )
        let output = viewModel.transform(input: input)
        
        output.apps
            .bind(to: mainView.tableView.rx.items(
                cellIdentifier: SearchTableViewCell.identifier,
                cellType: SearchTableViewCell.self)
            ) { (row, element, cell) in
                cell.updateUI(element: element)
            }
            .disposed(by: disposeBag)
        
        mainView.tableView.rx
            .modelSelected(SearchResult.self)
            .bind(with: self) { owner, data in
                let vc = DetailViewController()
                vc.data = data
                owner.navigationController?.pushViewController(
                    vc, animated: true
                )
            }
            .disposed(by: disposeBag)
    }
}
