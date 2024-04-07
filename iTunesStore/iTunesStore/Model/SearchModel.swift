//
//  SearchModel.swift
//  iTunesStore
//
//  Created by 김재석 on 4/8/24.
//

import Foundation

struct SearchModel: Decodable {
    let results: [SearchResult]
}

struct SearchResult: Decodable {
    let trackId: Int
    let trackName: String
    let description: String
    let artworkUrl100: String
    let sellerName: String
    let screenshotUrls: [String]
}
