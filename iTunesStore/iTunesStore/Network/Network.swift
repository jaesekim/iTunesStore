//
//  Network.swift
//  iTunesStore
//
//  Created by 김재석 on 4/8/24.
//

import Foundation
import RxSwift
import RxCocoa

enum APIError: Error {
    case invalidURL
    case unknownResponse
    case statusError
}

class Network {
    
    static let shared = Network()
    
    func fetchSearchAppData(term: String) -> Observable<SearchModel> {
        
        return Observable<SearchModel>.create { observer in
            guard let url = URL(
                string: "https://itunes.apple.com/search?country=KR&media=software&term=\(term)"
            ) else {
                observer.onError(APIError.invalidURL)
                return Disposables.create()
            }
            
            var urlRequest = URLRequest(url: url)
            urlRequest.setValue(
                "XYZ",
                forHTTPHeaderField: "User-Agent"
            )
            
            URLSession.shared.dataTask(with: urlRequest) { data, response, error in
                
                if let _ = error {
                    print("first error")
                    observer.onError(APIError.unknownResponse)
                    return
                }
                
                guard let response = response as? HTTPURLResponse,
                      (200...299).contains(response.statusCode) else {
                    print("Response Error")
                    return
                }
                if let data = data,
                   let appData = try? JSONDecoder().decode(
                    SearchModel.self, from: data
                   ) {
                    observer.onNext(appData)
                    observer.onCompleted()
                    // onNext + onCompleted = Single(Trait)
                    // onNext 다음에 onComplete 되는 것 잊으면 안 됨. 자연스러운 흐름
                } else {
                    print("last error")
                    observer.onError(APIError.unknownResponse)
                }
            }.resume()
            
            return Disposables.create()
        }
    }
}
