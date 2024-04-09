//
//  SearchBookmarkViewModel.swift
//  iTunesStore
//
//  Created by 김재석 on 4/8/24.
//

import Foundation
import RxSwift
import RxCocoa

class SearchBookmarkViewModel {
    
    let disposeBag = DisposeBag()
    let repository = Repository()

    let trackId = PublishSubject<Int>()
    
    struct Input {
        let bookmarkTap: ControlEvent<Void>
    }
    
    struct Output {
        let bookmarkStatus: PublishRelay<Bool>
    }
    
    func transform(input: Input) {
        
        input.bookmarkTap
            .withLatestFrom(trackId)
            .subscribe(with: self) { owner, id in
                let list = owner.repository.fetchItem(BookmarkTable.self)
                let data = BookmarkTable(trackId: id)
                owner.repository.createItem(data)
            } onError: { _, _ in
                print("Error")
            } onCompleted: { _ in
                print("onComplete")
            }
            .disposed(by: disposeBag)

    }
}
