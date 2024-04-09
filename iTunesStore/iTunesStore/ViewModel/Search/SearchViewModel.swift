//
//  SearchViewModel.swift
//  iTunesStore
//
//  Created by 김재석 on 4/8/24.
//

import Foundation
import RxSwift
import RxCocoa

class SearchViewModel {
    
    let disposeBag = DisposeBag()

    struct Input{
        let searchTap: ControlEvent<Void>
        let searchText: ControlProperty<String?>
    }
    
    struct Output {
        let apps: PublishRelay<[SearchResult]>
    }
    
    func transform(input: Input) -> Output {
        
        let searchedList = PublishRelay<[SearchResult]>()

        input.searchTap
            .debounce(.seconds(1), scheduler: MainScheduler.instance)
            .withLatestFrom(input.searchText.orEmpty)
            .distinctUntilChanged()
            .map { value in
                print(value)
                return String(value) }
            .flatMap {
//                Network.shared.fetchSearchAppData(term: $0)
                Network.shared.fetchAppDataAlamofire(term: $0)
            }
            .debug()
            .subscribe(with: self) { owner, value in
                let data = value.results
                
                searchedList.accept(data.isEmpty ? [] : data)
            } onError: { _, _ in
                print("Transform Error")
            } onCompleted: { _ in
                print("Transform Completed")
            } onDisposed: { _ in
                print("Transform Disposed")
            }
            .disposed(by: disposeBag)

        // 검색어 다 지우면 테이블 비워주기
        input.searchText
            .orEmpty
            .debounce(.seconds(1), scheduler: MainScheduler.instance)
            .distinctUntilChanged()
            .bind(with: self) { owner, value in
                if value.isEmpty {
                    searchedList.accept([])
                }
            }
            .disposed(by: disposeBag)

        return Output(
            apps: searchedList
        )
    }
}
