//
//  BookmarkCollectionViewCell.swift
//  iTunesStore
//
//  Created by 김재석 on 4/8/24.
//

import UIKit
import RxSwift

final class BookmarkCollectionViewCell: UICollectionViewCell {
    
    var disposeBag = DisposeBag()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        disposeBag = DisposeBag()
    }
}
