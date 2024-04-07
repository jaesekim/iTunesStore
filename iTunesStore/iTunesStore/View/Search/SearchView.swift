//
//  SearchView.swift
//  iTunesStore
//
//  Created by 김재석 on 4/8/24.
//

import UIKit
import SnapKit

final class SearchView: BaseView {

    let searchBar = {
        let view = UISearchBar()
        view.searchBarStyle = .minimal
        return view
    }()
    let tableView = {
        let view = UITableView()
        view.register(
            SearchTableViewCell.self,
            forCellReuseIdentifier: "SearchTableViewCell"
        )
        view.rowHeight = 100
        return view
    }()

    override func configureHierarchy() {
        [
            searchBar,
            tableView
        ].forEach { addSubview($0) }
    }
    override func configureConstraints() {
        searchBar.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide).offset(12)
            make.horizontalEdges.equalToSuperview().inset(12)
            make.height.equalTo(44)
        }
        tableView.snp.makeConstraints { make in
            make.top.equalTo(searchBar.snp.bottom).offset(20)
            make.horizontalEdges.equalToSuperview().inset(12)
            make.bottom.equalTo(safeAreaLayoutGuide)
        }
    }

}
