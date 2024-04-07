//
//  DetailView.swift
//  iTunesStore
//
//  Created by 김재석 on 4/8/24.
//

import UIKit
import SnapKit
import Kingfisher
import Then

final class DetailView: BaseView {

    let scrollView = UIScrollView().then {
        $0.showsVerticalScrollIndicator = false
    }
    let contentView = UIView()
    
    let appImage = UIImageView(frame: .zero).then {
        $0.contentMode = .scaleAspectFit
    }
    
    let appLabel = UILabel().then {
        $0.numberOfLines = 0
        $0.font = .boldSystemFont(ofSize: 18)
    }
    let appDescription = UILabel().then {
        $0.numberOfLines = 0
        $0.font = .systemFont(
            ofSize: 16,
            weight: .medium
        )
    }

    override func configureHierarchy() {
        addSubview(scrollView)
        scrollView.addSubview(contentView)
        [
            appImage,
            appLabel,
            appDescription
        ].forEach { contentView.addSubview($0) }
    }
    override func configureConstraints() {
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        contentView.snp.makeConstraints { make in
            make.edges.equalTo(scrollView.contentLayoutGuide)
            make.width.equalTo(scrollView.snp.width)
            make.height.greaterThanOrEqualTo(snp.height).priority(.low)
        }
        appImage.snp.makeConstraints { make in
            make.size.equalTo(100)
            make.top.leading.equalToSuperview().offset(20)
        }
        appLabel.snp.makeConstraints { make in
            make.centerY.equalTo(appImage.snp.centerY)
            make.height.greaterThanOrEqualTo(24)
            make.leading.equalTo(appImage.snp.trailing).offset(12)
            make.trailing.equalToSuperview().offset(-12)
        }
        appDescription.snp.makeConstraints { make in
            make.top.equalTo(appImage.snp.bottom).offset(20)
            make.horizontalEdges.equalToSuperview().inset(12)
            make.height.greaterThanOrEqualTo(44)
        }
    }
    
    func updateUI(data: SearchResult) {
        appImage.kf.setImage(
            with: URL(string: data.artworkUrl100)!
        )
        appLabel.text = data.trackName
        appDescription.text = data.description
    }
}
